import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';
import 'src/repository/src/repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  runApp(App(
    connectivity: Connectivity(),
    registerRepository: RegisterRepositoryImpl(),
    loginRepository: LoginRepositoryImpl(),
  ));
}
