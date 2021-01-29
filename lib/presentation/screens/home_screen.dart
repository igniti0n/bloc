import 'package:flutter/material.dart';

import '../../logic/cubits/counter_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static final routeName = '/';

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<HomeScreen> {
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
            Column(
          children: [
            TextButton(
              child: Text('GO TO NEXT SCREEN'),
              onPressed: () {
                Navigator.of(context).pushNamed<void>('/second');
              },
            ),
            TextButton(
              child: Text('GO TO PREVIOS SCREEN'),
              onPressed: () {},
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
            heroTag: HomeScreen.routeName + '1',
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
          ),
          FloatingActionButton(
            heroTag: HomeScreen.routeName + '2',
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).dicrement();
            },
          ),
        ],
      ),
    );
  }
}
