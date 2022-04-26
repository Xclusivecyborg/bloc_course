import 'package:bloc_course/respository/news_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      if (res == List) {
          emit(state.copyWith(news: res, loadState: LoadState.loaded));
      }else{
          emit(state.copyWith(news: [], error: res, loadState: LoadState.error));
      }
    
    } catch (e) {
      emit(state.copyWith(loadState: LoadState.error, error: e.toString()));
    }
  }
}
