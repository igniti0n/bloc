import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'countercubit_state.dart';

class CountercubitCubit extends Cubit<CounterState> {
  CountercubitCubit() : super(CounterInitialState());

  void increment() => emit(CounterIncrementState(state.value + 1));

  void dicrement() => emit(CounterIncrementState(state.value - 1));
}
