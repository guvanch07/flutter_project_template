// ignore_for_file: avoid_classes_with_only_static_members

import 'package:cloud_firestore/cloud_firestore.dart' as fs;

class FirebaseTimestampExtension {
  /// Convert DateTime to fs.Timestamp
  static fs.Timestamp toJsonTimestamp(DateTime date) =>
      fs.Timestamp.fromDate(date);

  /// Convert fs.Timestamp to DateTime
  static DateTime fromJsonTimestamp(dynamic raw) {
    if (raw is fs.Timestamp) {
      return raw.toDate();
    } else if (raw is String) {
      return DateTime.tryParse(raw) ?? DateTime.now();
    } else {
      return DateTime.now();
    }
  }
}
