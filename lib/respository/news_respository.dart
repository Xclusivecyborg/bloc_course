import 'package:bloc_course/constants/app_strings.dart';
import 'package:equatable/equatable.dart';

import '../models/news_model.dart';
import '../services/api_service.dart';

class NewsRepository extends Equatable {
  const NewsRepository({required this.service});

  final ApiService service;

  Future<List<News>> getNews() async {
    final res = await service.get(url: url + apiKey);
    if (res.statusCode == 200) {
      List news = res.data['articles'];
      return news.map((e) => News.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  List<Object> get props => [service];
}
