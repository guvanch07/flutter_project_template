// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:{{project_name}}/internal/image_cache_manager/file_system/application_file_system.dart';

/// Cache manager for temporary directory
class TempCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'tempStoreCache';

  static final TempCacheManager _instance = TempCacheManager._();

  factory TempCacheManager() => _instance;

  TempCacheManager._()
    : super(
        Config(
          key,
          stalePeriod: const Duration(days: 14),
          maxNrOfCacheObjects: 100,
          repo: JsonCacheInfoRepository(databaseName: key),
          fileService: HttpFileService()..concurrentFetches = 4,
        ),
      );
}

// Cache manager for application directory
class PersistentStoreCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'persistentStoreCache';

  static final PersistentStoreCacheManager _instance =
      PersistentStoreCacheManager._();

  factory PersistentStoreCacheManager() => _instance;

  PersistentStoreCacheManager._()
    : super(
        Config(
          key,
          stalePeriod: const Duration(days: 1095),
          maxNrOfCacheObjects: 100000,
          repo: JsonCacheInfoRepository(databaseName: key),
          fileSystem: ApplicationFileSystem(key),
          fileService: HttpFileService()..concurrentFetches = 4,
        ),
      );
}
