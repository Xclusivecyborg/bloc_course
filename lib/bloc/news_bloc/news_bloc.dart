import 'package:bloc_course/respository/news_respository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/news_model.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._repository)
      : super(const NewsState(loadState: LoadState.loading, news: [])) {
    on<NewsEvent>(_fetchNews);
  }

  final NewsRepository _repository;

  void _fetchNews(NewsEvent event, Emitter<NewsState> emit) async {
    try {
      final res = await _repository.getNews();

      emit(state.copyWith(news: res, loadState: LoadState.loaded));
    } on DioError catch (e) {
      print(e);
      emit(state.copyWith(loadState: LoadState.error, error: e.toString()));
    }
  }
}
