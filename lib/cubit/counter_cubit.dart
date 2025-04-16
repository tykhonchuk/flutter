import "package:flutter_bloc/flutter_bloc.dart";

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(10);

  void increment() {
    final newState = state + 1;
    print("Incremented: $newState");

    emit(newState);
  }

  void decrement() {
    final newState = state - 1;
    print("Decremented start: $newState");
    Future.delayed(const Duration(seconds: 5), () {
      print("Decremented end: $newState");
      if (!isClosed) {
        emit(newState);
      }
    });
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
  }
}
