import 'package:get_it/get_it.dart';
import 'package:provider_example/core/services/api.dart';
import 'package:provider_example/core/services/navigation_service.dart';
import 'package:provider_example/core/viewmodels/main_view_model.dart';
import 'package:provider_example/core/viewmodels/user_pofile_view_model.dart';
/*You will declare all the dependencies in this file, every model and service must have its dependencies in this file so you can locate them on every file of your project.
Undeclared dependencies will result in a crash after launch */

final locator = GetIt.instance;

void setupLocator() {
  //Dependencies
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => UserProfileViewModel());
  locator.registerFactory(() => Api());
}
