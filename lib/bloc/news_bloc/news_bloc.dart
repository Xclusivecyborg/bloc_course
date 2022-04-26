import 'package:bloc_course/respository/news_respository.dart';
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
      if (res is List<News>) {
        emit(state.copyWith(news: res, loadState: LoadState.loaded));
      } else {
        emit(NewsState(
          loadState: LoadState.error,
          error: res as String,
        ));
      }
    } catch (e) {
      emit(state.copyWith(loadState: LoadState.error, error: e.toString()));
    }
  }
}
