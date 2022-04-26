

class CubitExampleState {
  final HomePageState state;
  final String title;

  CubitExampleState({
    this.state = HomePageState.initial,
    this.title = '',
  });
}

CubitExampleState copyWith({
  HomePageState state = HomePageState.initial,
  String title = '',
}) {
  return CubitExampleState(
    state: state,
    title: title,
  );
}

enum HomePageState { initial, loading, loaded, error }
