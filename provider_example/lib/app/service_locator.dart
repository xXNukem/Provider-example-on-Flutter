import 'package:get_it/get_it.dart';
import 'package:provider_example/core/services/api.dart';
import 'package:provider_example/core/services/navigation_service.dart';
import 'package:provider_example/core/viewmodels/main_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  //Dependencies
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => Api());
}
