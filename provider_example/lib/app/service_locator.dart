import 'package:get_it/get_it.dart';
import 'package:provider_example/core/services/navigation_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  //Dependencies
  locator.registerLazySingleton(() => NavigationService());
}
