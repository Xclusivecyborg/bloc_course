import 'package:bloc_course/bloc/news_bloc/news_bloc.dart';
import 'package:bloc_course/bloc_observer.dart';
import 'package:bloc_course/respository/news_respository.dart';
import 'package:bloc_course/services/api_service_impl.dart';
import 'package:bloc_course/view/news/news_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit_example_cubit/cubit_cubit.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  },
  blocObserver: SimpleBlocObserver()
  );

 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitExample>(
          create: (context) => CubitExample(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(NewsRepository(service: ApiServiceImpl(dio: Dio()))),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NewsView(),
      ),
    );
  }
}


