import 'package:bus_application/app/di/di.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    const App(),
  );
}
