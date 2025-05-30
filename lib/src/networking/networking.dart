import 'package:dio/dio.dart';

class Networking {
  final Dio _dio;
  String url = 'https://anarock-super-admin.vayuz.com/v2/form-elements';

  Networking({Dio? dio}) : _dio = dio ?? Dio();

  Future<dynamic> fetchFormElements() async {
    final queryParams = {
      'domain': 'anarock-host-poc.vercel.app',
      'formId': 'login',
    };

    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to fetch: ${response.statusMessage}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
