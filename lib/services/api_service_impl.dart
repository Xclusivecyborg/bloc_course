import 'package:bloc_course/services/api_service.dart';
import 'package:dio/dio.dart';

class ApiServiceImpl extends ApiService {
  ApiServiceImpl({required this.dio});
  final Dio dio;
  @override
  Future<Response> get({required String url}) async {
    try {
      return await dio.get(url);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
