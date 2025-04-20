import "package:flutter_bloc/flutter_bloc.dart";

class CounterCubit extends Cubit <int> {
  CounterCubit():super(0);

  void increment() {
    final newState = state + 1;
    emit(newState);
  }

  void decrement() {
    final newState = state - 1;
    emit(newState);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
  }
}
