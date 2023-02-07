import 'package:crud_bloc/controllers/user_controller.dart';
import 'package:crud_bloc/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.asNewInstance();

void setUp() {
  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<UserController>(() => UserController());
}
