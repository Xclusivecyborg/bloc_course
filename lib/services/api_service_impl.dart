import 'package:bloc_course/services/api_service.dart';
import 'package:dio/dio.dart';

class ApiServiceImpl extends ApiService {
  ApiServiceImpl(this._dio);
  final Dio _dio;
  @override
  Future<Response> get({required String url}) async {
    final response = await _dio.get(url);
    return response;
  }
}
