import 'package:file/file.dart' hide FileSystem;
import 'package:file/local.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// FileSystem, which stores cache not in the temporary folder, but in the permanent application directory
class ApplicationFileSystem implements FileSystem {
  final Future<Directory> _fileDir;
  final String _cacheKey;

  @override
  Future<Directory> get fileDir => _fileDir;

  ApplicationFileSystem(this._cacheKey)
    : _fileDir = _createDirectory(_cacheKey);

  static Future<Directory> _createDirectory(String key) async {
    final baseDir = await getApplicationDocumentsDirectory();
    // final path = p.join(baseDir.path, key);
    final path = p.join(baseDir.path);

    const fs = LocalFileSystem();
    final directory = fs.directory(path);
    await directory.create(recursive: true);
    return directory;
  }

  @override
  Future<File> createFile(String name) async {
    final directory = await _fileDir;
    if (!(await directory.exists())) {
      await _createDirectory(_cacheKey);
    }
    return directory.childFile(name);
  }
}
