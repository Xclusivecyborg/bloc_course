import 'package:bloc_course/bloc/news_bloc/news_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit_example_cubit/cubit_cubit.dart';
import '../../bloc/cubit_example_cubit/cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    // BlocProvider.of<HomePageViewModel>(context).onTap();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Home Page'),
      ),
      body: BlocBuilder<CubitExample, CubitExampleState>(
          builder: (context, state) {
        final model = BlocProvider.of<CubitExample>(context);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              state.state == HomePageState.error
                  ? const Text(
                      'There is an error',
                    )
                  : const SizedBox(),
              TextButton(
                onPressed: () => model.onTap(),
                child: state.state == HomePageState.initial
                    ? const Text('Tap to login')
                    : state.state == HomePageState.loading
                        ? const CircularProgressIndicator.adaptive()
                        : state.state == HomePageState.error
                            ? const Text("Unable to login")
                            : const Text('Login successul'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
