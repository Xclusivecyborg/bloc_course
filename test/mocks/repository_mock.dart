import 'package:bloc_course/respository/news_respository.dart';
import 'package:bloc_course/services/api_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements NewsRepository {}

class MockApiservice extends Mock implements ApiServiceImpl {
  MockApiservice({
    required this.dio,
  });
  @override
  final Dio dio;
  @override
  Future<Response> get({required String url}) async {
    return await dio.get(url);
  }
}
