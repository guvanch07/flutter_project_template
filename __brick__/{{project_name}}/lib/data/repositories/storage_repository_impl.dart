import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:mime/mime.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';
import 'package:{{project_name}}/domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  final FirebaseStorage _storage;

  StorageRepositoryImpl({required FirebaseStorage storage})
    : _storage = storage;

  @override
  Future<Either<BaseFailure, String>> uploadFile({
    required File file,
    required String path,
    String? contentType,
  }) async {
    try {
      // Determine content type if not provided
      final mimeType = contentType ?? lookupMimeType(file.path);

      // Create a storage reference to the specified path
      final ref = _storage.ref().child(path);

      // Set upload metadata with content type if available
      SettableMetadata? metadata;
      if (mimeType != null) {
        metadata = SettableMetadata(
          contentType: mimeType,
          customMetadata: {'originalFileName': file.path.split('/').last},
          cacheControl: 'public,max-age=15552000',
        );
      }

      // Upload the file
      await ref.putFile(file, metadata);

      // Get the download URL
      final downloadUrl = await ref.getDownloadURL();

      return Right(downloadUrl);
    } on FirebaseException catch (e) {
      debugPrint('Firebase error during upload: ${e.code} - ${e.message}');
      if ((e.message ?? '').toLowerCase().contains('internet connection')) {
        return const Left(NoInternetConnectionFailure());
      }
      return Left(
        StorageFailure(
          'Firebase error: ${e.code} - ${e.message ?? "Unknown error"}',
        ),
      );
    } catch (e) {
      debugPrint('Error uploading file: $e');
      return Left(StorageFailure('Failed to upload file: ${e.toString()}'));
    }
  }

  @override
  Future<Either<BaseFailure, bool>> deleteFile(String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.delete();
      return const Right(true);
    } on FirebaseException catch (e) {
      debugPrint('Firebase error during delete: ${e.code} - ${e.message}');
      return Left(
        StorageFailure(
          'Firebase error: ${e.code} - ${e.message ?? "Unknown error"}',
        ),
      );
    } catch (e) {
      debugPrint('Error deleting file: $e');
      return Left(StorageFailure('Failed to delete file: ${e.toString()}'));
    }
  }
}
