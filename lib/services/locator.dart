import 'package:hafefly/services/storage.dart';
import 'package:hafefly/services/userController.dart';

import 'auth.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> setupServices() async {
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<StorageService>(StorageService());
  locator.registerSingleton<UserController>(UserController());
}
