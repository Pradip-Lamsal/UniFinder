import 'package:bus_application/features/home/data/models/course_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/auth/data/model/auth_hive_model.dart';
import '../../features/home/data/models/consultancy_model.dart';
import '../../features/home/data/models/university_model.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(UniversityModelAdapter());
  Hive.registerAdapter(CourseModelAdapter());
  Hive.registerAdapter(ConsultancyModelAdapter());
  Hive.registerAdapter(AuthHiveModelAdapter());

  // Open boxes for storage
  await Hive.openBox<UniversityModel>('universities');
  await Hive.openBox<CourseModel>('courses');
  await Hive.openBox<ConsultancyModel>('consultancies');
  await Hive.openBox<AuthHiveModel>('auth_hive');
}
