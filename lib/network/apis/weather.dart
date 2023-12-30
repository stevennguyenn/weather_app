import 'package:weather/network/network.dart';

class WeatherAPI {
  WeatherAPI._();

  static final instance = WeatherAPI._();

  Future<WeatherModel> getWeather({
    required double lat,
    required double long,
  }) async {
    final Map<String, dynamic> params = {
      'lat': '$lat',
      'lon': '$long',
    };
    final data = await NetworkRequest.instance.request(
      path: 'data/2.5/weather',
      params: params,
    );
    if (data['cod'] != 200) {
      throw data['message'] ?? '';
    }
    return WeatherModel.fromJson(data);
  }
}
