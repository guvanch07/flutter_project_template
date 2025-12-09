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
