import 'package:flutter/material.dart';

import './presentation/routes/route_generator.dart';
import './logic/cubits/counter_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  RouteGenerator _routeGenerator = new RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without qui,

          // changing the primarySwatch below to Colors.green and then invoke
          // "h,
          //ot reload" (pre,
          // )ss "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _routeGenerator.onGenerateRoute,
      ),
    );
  }
}
