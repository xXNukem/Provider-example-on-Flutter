import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_example/app/routes.dart';
import 'package:provider_example/ui/views/main_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /*
       case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      */
      case mainViewRoute:
        return MaterialPageRoute(builder: (_) => MainView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
