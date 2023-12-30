import 'package:weather/network/apis/apis.dart';

class ApiProvider {
  ApiProvider._();

  static final instance = ApiProvider._();

  WeatherAPI get weather => WeatherAPI.instance;
}
