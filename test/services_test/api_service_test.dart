import 'package:bloc_course/constants/app_strings.dart';
import 'package:bloc_course/services/api_service.dart';
import 'package:bloc_course/services/api_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock_dio.dart';

void main() {
  late MockDio dio;
  late ApiService service;
  setUp(() {
    dio = MockDio();
    service = ApiServiceImpl(dio: dio);
  });
  group('ApiService - ', () {
    test(' When called, a Response object is returned', () async {
      when(() => dio.get(
            any(),
          )).thenAnswer(
        (_) => Future.value(
          Response(
            data: <String, dynamic>{},
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        ),
      );
      final news = await service.get(url: url + apiKey);
      expect(news, isA<Response<dynamic>>());
    });
  });
}
