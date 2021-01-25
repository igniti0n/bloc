part of 'countercubit_cubit.dart';

abstract class CounterState {
  int value;
  CounterState(this.value);
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(0);
}

class CounterIncrementState extends CounterState {
  CounterIncrementState(int value) : super(value);
}
