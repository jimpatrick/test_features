import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial(0, false));

  void increment() => emit(CounterValueState(state.counterValue + 1, true));
  void decrement() => emit(CounterValueState(state.counterValue - 1, false));
}
