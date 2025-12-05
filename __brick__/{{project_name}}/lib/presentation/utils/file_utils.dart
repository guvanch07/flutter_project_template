// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Parameters for file copy operation in isolate
class FileCopyParams {
  final String sourcePath;
  final String destinationPath;

  const FileCopyParams({
    required this.sourcePath,
    required this.destinationPath,
  });
}

/// Copy file in isolate to prevent UI freezing
bool _copyFileInIsolate(FileCopyParams params) {
  try {
    final sourceFile = File(params.sourcePath);
    if (!sourceFile.existsSync()) {
      debugPrint('Source file does not exist: ${params.sourcePath}');
      return false;
    }

    final bytes = sourceFile.readAsBytesSync();
    File(params.destinationPath).writeAsBytesSync(bytes);

    return true;
  } catch (e) {
    debugPrint('Error copying file in isolate: $e');
    return false;
  }
}

class FileUtils {
  static Future<String> ensureAndroidFileAccessible(String originalPath) async {
    if (!Platform.isAndroid) return originalPath;

    try {
      final file = File(originalPath);

      // Check if file exists and is readable
      if (!file.existsSync()) {
        debugPrint(
            'Android file accessibility: Original file does not exist: $originalPath');
        return originalPath;
      }

      // Check if file is already in app's external files directory
      final appDir = await getExternalStorageDirectory();
      if (appDir != null && originalPath.startsWith(appDir.path)) {
        debugPrint(
            'Android file accessibility: File is already in app directory: $originalPath');
        return originalPath;
      }

      // File is not in app's external directory, copy it there
      debugPrint(
          'Android file accessibility: Copying file to app directory from: $originalPath');

      final bytes = await file.readAsBytes();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'copied_$timestamp.jpg';

      // Create directory if it doesn't exist
      final targetDir = Directory('${appDir?.path ?? ''}/Pictures');
      if (!targetDir.existsSync()) {
        await targetDir.create(recursive: true);
      }

      final targetPath = '${targetDir.path}/$fileName';
      final targetFile = File(targetPath);
      await targetFile.writeAsBytes(bytes);

      debugPrint('Android file accessibility: File copied to: $targetPath');
      return targetPath;
    } catch (e) {
      debugPrint(
          'Android file accessibility: Error ensuring file accessibility: $e');
      // Return original path if anything goes wrong
      return originalPath;
    }
  }

  /// Copy file in isolate to prevent UI freezing during file operations
  static Future<bool> copyFileInIsolate({
    required String sourcePath,
    required String destinationPath,
  }) async {
    try {
      final params = FileCopyParams(
        sourcePath: sourcePath,
        destinationPath: destinationPath,
      );

      // Run file copy in isolate using compute
      final success = await compute(_copyFileInIsolate, params);
      return success;
    } catch (e) {
      debugPrint('Error in copyFileInIsolate: $e');
      return false;
    }
  }
}
