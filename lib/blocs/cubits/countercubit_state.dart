part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int value;
  CounterState(this.value);
  @override
  // TODO: implement props
  List<int> get props => [value];
}
