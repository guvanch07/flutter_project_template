import 'package:bloc/bloc.dart';

/// Simple logging cubit for debugging
class LogCubit extends Cubit<List<String>> {
  LogCubit() : super([]);

  void addLog(String log) {
    emit([...state, log]);
  }

  void clearLogs() {
    emit([]);
  }
}
