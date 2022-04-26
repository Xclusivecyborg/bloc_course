import 'package:bloc_course/constants/app_strings.dart';
import 'package:bloc_course/services/api_service_impl.dart';
import 'package:dio/dio.dart';

import '../models/news_model.dart';

class NewsRepository {
  NewsRepository(this._service);

  final ApiServiceImpl _service;

  Future<T> getNews<T>() async {
    try {
      final res = await _service.get(url: url + apiKey);
      if (res.statusCode == 200) {
        final news = res.data['articles'];
        return news.map<News>((e) => News.fromJson(e)).toList();
      } else {
        return "An error occurred" as dynamic;
      }
    } on DioError catch (e) {
      print(e);
      return e.message as dynamic;
    }
  }
}
