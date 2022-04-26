import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_state.dart';

class CubitExample extends Cubit<CubitExampleState> {
  CubitExample() : super(CubitExampleState());

  Future<void> onTap() async {
    emit(
      copyWith(
        state: HomePageState.loading,
      ),
    );
    await Future.delayed(const Duration(seconds: 10), () {
      emit(
        copyWith(
          state: HomePageState.loaded,
          title: 'Bloc Home Page',
        ),
      );
    });
  }
}

