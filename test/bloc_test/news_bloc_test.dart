import 'package:bloc_course/bloc/news_bloc/news_bloc.dart';
import 'package:bloc_course/bloc/news_bloc/news_event.dart';
import 'package:bloc_course/bloc/news_bloc/news_state.dart';
import 'package:bloc_course/models/news_model.dart';
import 'package:bloc_course/respository/news_respository.dart';
import 'package:bloc_course/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import '../mocks/mock_dio.dart';
import '../mocks/repository_mock.dart';

void main() {
  late NewsBloc newsBloc;
  late ApiService mockApiService;
  Dio dio = MockDio();

  setUp(() {
    mockApiService = MockApiservice(dio: dio);
    newsBloc = NewsBloc(NewsRepository(service: mockApiService));
  });
  group('CounterBloc', () {
    test('News Bloc Test', () async {});

    blocTest<NewsBloc, NewsState>(
      'should emit [Loadstate.Loaded, and a List of News] when News is fetched successfully',
      build: () => newsBloc,
      act: (bloc) {
        when(() => dio.get(any())).thenAnswer(
          (invocation) {
            return Future.value(
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
                data: <String, dynamic>{
                  'articles': [
                    <String, dynamic>{
                      'title': 'title',
                      'description': 'description',
                      'url': 'url',
                      'urlToImage': 'urlToImage',
                      'publishedAt': 'publishedAt',
                    }
                  ]
                },
              ),
            );
          },
        );
        bloc.add(NewsFetching());
      },
      expect: () => [
        const NewsState(
          loadState: LoadState.loaded,
          news: [
            News(
              author: '',
              content: '',
              source: Source(
                id: '',
                name: '',
              ),
              title: 'title',
              description: 'description',
              url: 'url',
              urlToImage: 'urlToImage',
              publishedAt: 'publishedAt',
            ),
          ],
        )
      ],
      verify: (bloc) {
        expect(bloc.state.news.isEmpty, false);
        expect(bloc.state.news, isA<List<News>>());
      },
    );
  });
}
