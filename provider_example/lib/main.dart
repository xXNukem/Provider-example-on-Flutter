import 'package:flutter/material.dart';
import 'package:provider_example/app/routes.dart';
import 'package:provider_example/app/service_locator.dart';
import 'package:provider_example/core/services/navigation_service.dart';

import 'app/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: Router.generateRoute,
      initialRoute: mainViewRoute,
    );
  }
}
