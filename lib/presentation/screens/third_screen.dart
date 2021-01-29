import 'package:flutter/material.dart';

import '../../logic/cubits/counter_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key}) : super(key: key);
  static final routeName = '/third';

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body:
          // BlocListener<CountercubitCubit, CounterState>(
          //     listener: (context, state) {
          //       // TODO: implement listener
          //       Scaffold.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text("${state.value}"),
          //           duration: Duration(milliseconds: 400),
          //           behavior: SnackBarBehavior.fixed,
          //         ),
          //       );
          //     },
          //     listenWhen: (newState, oldState) {
          //       if (oldState.value != 4) return true;
          //       return false;
          //     },
          SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TextButton(child: Text('GO TO NEXT SCREEN'), onPressed: null),
            TextButton(
              child: Text('GO TO PREVIOS SCREEN'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                // TODO: implement listener
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${state.value}"),
                    duration: Duration(milliseconds: 400),
                    behavior: SnackBarBehavior.fixed,
                  ),
                );
              },
              builder: (context, state) {
                return Text(state.value != 4
                    ? "hello buraz ${state.value}"
                    : "4 JEBOTE ${state.value}");
              },
              buildWhen: (a, b) {
                // if (a.value < b.value) return true;
                return true;
              },
              listenWhen: (newState, oldState) {
                if (newState.value > oldState.value) return true;
                return false;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: ThirdScreen.routeName + '1',
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
          ),
          FloatingActionButton(
            heroTag: ThirdScreen.routeName + '2',
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).dicrement();
            },
          ),
        ],
      ),
    );
  }
}
