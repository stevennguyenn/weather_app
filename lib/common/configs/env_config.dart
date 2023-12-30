import 'package:flutter_config_plus/flutter_config_plus.dart';

class EnvConfig {
  static final baseUrl = FlutterConfigPlus.get('BASE_URL');
  static final apiKey = FlutterConfigPlus.get('API_KEY');
}