import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api_service.dart';
import '../../core/network/hive_service.dart';
import '../../features/auth/data/data_source/auth_local_datasource/auth_local_datasource.dart';
import '../../features/auth/data/data_source/auth_local_datasource/remote_data_source/auth_remote_datasource.dart';
import '../../features/auth/data/repository/auth_local_repository.dart';
import '../../features/auth/data/repository/auth_remote_repository.dart';
import '../../features/auth/domain/use_case/login_usecase.dart';
import '../../features/auth/domain/use_case/register_user_usecase.dart';
import '../../features/auth/domain/use_case/upload_image_usecase.dart';
import '../../features/auth/presentation/view_model/login/login_bloc.dart';
import '../../features/auth/presentation/view_model/signup/register_bloc.dart';
import '../../features/home/data/datasource/home_remote_datasource.dart';
import '../../features/home/presentation/view_model/consultancy_bloc/consultancies_bloc.dart';
import '../../features/home/presentation/view_model/course_bloc/courses_bloc.dart';
import '../../features/home/presentation/view_model/home_cubit.dart';
import '../../features/home/presentation/view_model/unvi_bloc/universities_bloc.dart';
import '../shared_prefs/token_shared_prefs.dart';

final getIt = GetIt.instance;

/// Initializes all dependencies in the correct order.
/// Ensures that dependencies like HomeCubit are registered before LoginBloc, which depends on it.
Future<void> initDependencies() async {
  // Core services first
  await _initHiveService();
  await _initSharedPreferences();
  await _initTokenSharedPrefs();
  await _initApiService();

  // Home dependencies must come before Login dependencies due to LoginBloc's dependency on HomeCubit
  await _initHomeDependencies();

  // Auth-related dependencies
  await _initRegisterDependencies();
  await _initLoginDependencies();

  // Other feature dependencies
  await _initCoursesDependencies();
  await _initUniversitiesDependencies();
  await _initConsultanciesDependencies();
}

/// Registers SharedPreferences as a lazy singleton.
Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

/// Registers TokenSharedPrefs, which depends on SharedPreferences.
Future<void> _initTokenSharedPrefs() async {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );
}

/// Registers Dio via ApiService.
Future<void> _initApiService() async {
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

/// Registers HiveService for local storage.
Future<void> _initHiveService() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

/// Registers dependencies for the registration feature.
Future<void> _initRegisterDependencies() async {
  // Local and remote data sources
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthLocalRepository>(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRemoteRepository>()),
  );
  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(getIt<AuthRemoteRepository>()),
  );

  // RegisterBloc
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt<RegisterUseCase>(),
      uploadImageUsecase: getIt<UploadImageUsecase>(),
    ),
  );
}

/// Registers dependencies for the login feature.
/// Depends on RegisterBloc and HomeCubit, so it must come after their initialization.
Future<void> _initLoginDependencies() async {
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

/// Registers dependencies for the home feature.
/// Must be called before _initLoginDependencies due to LoginBloc's dependency on HomeCubit.
Future<void> _initHomeDependencies() async {
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(),
  );

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

/// Registers dependencies for the courses feature.
Future<void> _initCoursesDependencies() async {
  getIt.registerFactory<CoursesBloc>(
    () => CoursesBloc(getIt<HomeRemoteDataSource>()),
  );
}

/// Registers dependencies for the universities feature.
Future<void> _initUniversitiesDependencies() async {
  getIt.registerFactory<UniversitiesBloc>(
    () => UniversitiesBloc(getIt<HomeRemoteDataSource>()),
  );
}

/// Registers dependencies for the consultancies feature.
Future<void> _initConsultanciesDependencies() async {
  getIt.registerFactory<ConsultanciesBloc>(
    () => ConsultanciesBloc(getIt<HomeRemoteDataSource>()),
  );
}
