import 'app_env.dart';

class AppConstants {
  static const AppEnv env = AppEnv.dev; // Default to dev

  // Backend URLs
  static const String updateCustomerUrl =
      'https://api.example.com/update_customer';
  static const String getDataByHashUrl =
      'https://api.example.com/get_data_by_hash';
  static const String getTokenByHashUrl =
      'https://api.example.com/get_token_by_hash';
  static const String getDataByDeviceIdUrl =
      'https://api.example.com/get_data_by_device_id';
  static const String getTokenByDeviceIdUrl =
      'https://api.example.com/get_token_by_device_id';
  static const String deeplinkScheme = 'app';
  static const String baseUrl = 'https://api.example.com/en';
}
