import 'package:blocPractice/blocs/cubits/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubitgroup', () {
    CounterCubit _cubit;
    setUp(() {
      _cubit = new CounterCubit();
    });

    test('Test if the CounterCubit inital state is equal to 0', () {
      expect(_cubit.state, CounterState(0));
    });

    blocTest(
      'Tests if the cubit state goes form zero to one after incrementing',
      build: () => _cubit,
      act: (cubit) => cubit.increment(),
      expect: [CounterState(1)],
    );

    blocTest(
      'Tests if the cubit state goes form zero to minus one after dicrementing',
      build: () => _cubit,
      act: (cubit) => _cubit.dicrement(),
      expect: [CounterState(-1)],
    );

    tearDown(() {
      _cubit.close();
    });
  });
}
