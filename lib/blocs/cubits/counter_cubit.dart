import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'countercubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void increment() => emit(CounterState(state.value + 1));

  void dicrement() => emit(CounterState(state.value - 1));
}
