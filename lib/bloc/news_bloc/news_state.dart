import 'package:equatable/equatable.dart';

import 'package:bloc_course/models/news_model.dart';

class NewsState extends Equatable {
  final List<News> news;
  final LoadState loadState;
  final String error;

  const NewsState(
      {this.news = const [],
      this.error = '',
      this.loadState = LoadState.loading});

  NewsState copyWith({List<News>? news, LoadState? loadState, String? error}) {
    return NewsState(
      news: news ?? this.news,
      loadState: loadState ?? this.loadState,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [news, loadState];
}

enum LoadState { loading, loaded, error }
