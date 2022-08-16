import 'package:bloc_course/bloc/cubit_example_cubit/cubit_cubit.dart';
import 'package:bloc_course/bloc/cubit_example_cubit/cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CubitExample homePageViewModel;
  setUp(() {
    homePageViewModel = CubitExample();
  });
  group('HomePage ViewModel Test', () {
    test('First Test', () {
      expect(homePageViewModel.state.state, HomePageState.initial);
    });

    test('Second Test', () {
      homePageViewModel.onTap();
      expect(homePageViewModel.state.state, HomePageState.loading);

    });

    test('Third Test', () {
      homePageViewModel.onTap().whenComplete(() {
        expect(homePageViewModel.state.state, HomePageState.loaded);
        expect(homePageViewModel.state.title, 'Bloc Home Page');
      });
    });
  });
}
