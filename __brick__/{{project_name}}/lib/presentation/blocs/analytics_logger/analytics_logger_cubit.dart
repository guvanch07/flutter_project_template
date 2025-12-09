// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/presentation/blocs/analytics_logger/analytics_log_item.dart';

class AnalyticsLoggerCubit extends Cubit<List<AnalyticsLogItem>> {
  AnalyticsLoggerCubit() : super([]);

  void addItem(AnalyticsLogItem item) {
    emit([...state, item]);
  }

  void clear() {
    emit([]);
  }
}
