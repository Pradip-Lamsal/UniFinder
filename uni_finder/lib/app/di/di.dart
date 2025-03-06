import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api_service.dart';
import '../../core/network/hive_service.dart';
// Auth Dependencies
import '../../features/auth/data/data_source/auth_local_datasource/auth_local_datasource.dart';
import '../../features/auth/data/data_source/auth_local_datasource/remote_data_source/auth_remote_datasource.dart';
import '../../features/auth/data/repository/auth_local_repository.dart';
import '../../features/auth/data/repository/auth_remote_repository.dart';
import '../../features/auth/domain/use_case/login_usecase.dart';
import '../../features/auth/domain/use_case/register_user_usecase.dart';
import '../../features/auth/domain/use_case/upload_image_usecase.dart';
import '../../features/auth/presentation/view_model/login/login_bloc.dart';
import '../../features/auth/presentation/view_model/signup/register_bloc.dart';
// Home Dependencies
import '../../features/home/data/datasource/home_remote_datasource.dart';
import '../../features/home/presentation/view_model/consultancy_bloc/consultancies_bloc.dart';
import '../../features/home/presentation/view_model/course_bloc/courses_bloc.dart';
import '../../features/home/presentation/view_model/home_cubit.dart';
import '../../features/home/presentation/view_model/unvi_bloc/universities_bloc.dart';
import '../shared_prefs/token_shared_prefs.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initSharedPreferences();
  await _initTokenSharedPrefs();
  await _initApiService();

  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initHomeDependencies();
  await _initCoursesDependencies();
  await _initUniversitiesDependencies();
  await _initConsultanciesDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

Future<void> _initTokenSharedPrefs() async {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );
}

Future<void> _initApiService() async {
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

Future<void> _initHiveService() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

Future<void> _initRegisterDependencies() async {
  // Initialize local data source
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // Initialize repositories
  getIt.registerLazySingleton<AuthLocalRepository>(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // Register UseCases
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRemoteRepository>()),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(getIt<AuthRemoteRepository>()),
  );

  // Register BLoC for Authentication
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt<RegisterUseCase>(),
      uploadImageUsecase: getIt<UploadImageUsecase>(),
    ),
  );
}

Future<void> _initLoginDependencies() async {
  // Register LoginUseCase with AuthRemoteRepository and TokenSharedPrefs
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

Future<void> _initHomeDependencies() async {
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(),
  );

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

// Initialize Courses Dependencies
Future<void> _initCoursesDependencies() async {
  getIt.registerFactory<CoursesBloc>(
    () => CoursesBloc(getIt<HomeRemoteDataSource>()),
  );
}

// Initialize Universities Dependencies
Future<void> _initUniversitiesDependencies() async {
  getIt.registerFactory<UniversitiesBloc>(
    () => UniversitiesBloc(getIt<HomeRemoteDataSource>()),
  );
}

// Initialize Consultancies Dependencies
Future<void> _initConsultanciesDependencies() async {
  getIt.registerFactory<ConsultanciesBloc>(
    () => ConsultanciesBloc(getIt<HomeRemoteDataSource>()),
  );
}
