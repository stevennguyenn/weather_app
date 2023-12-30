import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/network/network.dart';

import '../common/configs/configs.dart';

class NetworkRequest {
  NetworkRequest._();

  static final NetworkRequest instance = NetworkRequest._();

  Future<Map> request({
    required String path,
    Map<String, dynamic>? params,
    NetworkMethod method = NetworkMethod.get,
  }) async {
    params?['appid'] = EnvConfig.apiKey;
    final url = Uri.https(
      EnvConfig.baseUrl,
      path,
      params,
    );
    final response = await http.get(url);
    final decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return decodeResponse;
  }
}
