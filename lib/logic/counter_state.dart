part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  const CounterState(this.counterValue, this.isIncrement);
  final int counterValue;
  final bool isIncrement;
}

class CounterInitial extends CounterState {
  const CounterInitial(super.counterValue, super.isIncrement);
}

class CounterValueState extends CounterState {
  const CounterValueState(super.counterValue, super.isIncrement);
}
