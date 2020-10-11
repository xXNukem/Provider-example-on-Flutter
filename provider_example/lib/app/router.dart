import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_example/app/routes.dart';
import 'package:provider_example/core/models/user.dart';
import 'package:provider_example/ui/views/main_view.dart';
import 'package:provider_example/ui/views/user_profile_view.dart';
/*In this file you must write the entire code for your rutes, remember that you can put some parameteres if you want.
Routes can be MaterialPageRoute or CupertinoPageRoute, you can use both in Android or IOs because the only diference is the animation that you will see bettween views. */

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /*
       case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      */
      case mainViewRoute:
        return MaterialPageRoute(builder: (_) => MainView());

      case userProfileViewRoute:
        var user = settings.arguments as User;
        return MaterialPageRoute(
            builder: (_) => UserProfileView(
                  user: user,
                ));

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
