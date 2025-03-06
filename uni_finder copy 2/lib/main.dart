import 'package:bus_application/app/di/di.dart';
import 'package:bus_application/app/routes.dart' show Routes;
import 'package:bus_application/core/apptheme/app_theme.dart';
import 'package:bus_application/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Static ValueNotifier for global theme state
  static final ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);

  // Static method to toggle the theme globally
  static void toggleTheme(bool value) {
    isDarkModeNotifier.value = value;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _initDependenciesFuture;

  @override
  void initState() {
    super.initState();
    _initDependenciesFuture = initDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initDependenciesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          // Show a loading screen while dependencies are being initialized
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          // Handle initialization error
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                  child: Text('Error initializing app: ${snapshot.error}')),
            ),
          );
        }

        // Dependencies are initialized, build the app with BlocProvider
        return BlocProvider<LoginBloc>(
          create: (context) => getIt<LoginBloc>(),
          child: ValueListenableBuilder<bool>(
            valueListenable: MyApp.isDarkModeNotifier,
            builder: (context, isDarkMode, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: getLightTheme(),
                darkTheme: getDarkTheme(),
                themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
                initialRoute: Routes.splash,
                onGenerateRoute: Routes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
