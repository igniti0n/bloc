import 'package:blocPractice/blocs/cubit/countercubit_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
        child: Center(
          child:
              // child: BlocBuilder<CountercubitCubit, CounterState>(
              //   builder: (context, state) {
              //     return Text(state.value != 4
              //         ? "hello buraz ${state.value}"
              //         : "4 JEBOTE ${state.value}");
              //   },
              //   // buildWhen: (a, b) {
              //   //   if (a.value < b.value) return true;
              //   //   return false;
              //   // },
              // ),
              BlocConsumer<CountercubitCubit, CounterState>(
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
              if (a.value < b.value) return true;
              return false;
            },
            listenWhen: (newState, oldState) {
              if (oldState.value != 4) return true;
              return false;
            },
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CountercubitCubit>(context).increment();
            },
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CountercubitCubit>(context).dicrement();
            },
          ),
        ],
      ),
    );
  }
}
