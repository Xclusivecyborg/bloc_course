import 'package:bloc_course/models/news_model.dart';
import 'package:bloc_course/respository/news_respository.dart';
import 'package:bloc_course/services/api_service.dart';
import 'package:bloc_course/services/api_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_dio.dart';

void main() {
  late NewsRepository repository;
  late MockDio dio;
  late ApiService service;
  setUp(() {
    dio = MockDio();
    service = ApiServiceImpl(dio: dio);
    repository = NewsRepository(service: service);
  });
  group('News Repository -', () {
    test('Test that the nesrepository class is instantiated', () { 
      expect(repository, isA<NewsRepository>());
    });

    test('NewsRepository - A List of news should be returned ', () async {
      when(() => dio.get(
            any(),
          )).thenAnswer(
        (_) => Future.value(
          Response(
            data: {"articles": []},
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        ),
      );
      final res = await repository.getNews();
      expect(res, isA<List<News>>());
    });
  });
}
