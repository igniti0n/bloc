import 'package:flutter/material.dart';

import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/second_screen.dart';
import '../../presentation/screens/third_screen.dart';
import '../../logic/cubits/counter_cubit.dart';

class RouteGenerator {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
        break;
      case '/second':
        return MaterialPageRoute(builder: (ctx) => SecondScreen());
        break;
      case '/third':
        return MaterialPageRoute(builder: (ctx) => ThirdScreen());
        break;
      default:
        return null;
    }
  }
}
