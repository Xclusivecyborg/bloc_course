import 'package:bloc_course/bloc/news_bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/news_bloc/news_event.dart';
import '../../bloc/news_bloc/news_state.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    context.read<NewsBloc>().add(NewsFetching());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state.loadState == LoadState.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.loadState == LoadState.loaded) {
              return ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.news[index].title ?? 'No data'),
                  );
                },
              );
            }
            return Center(child: Text(state.error));
          },
        ),
      ),
    );
  }
}
