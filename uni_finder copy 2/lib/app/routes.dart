import 'package:bus_application/main.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/view/login_view.dart';
import '../features/auth/presentation/view/register_view.dart';
import '../features/home/presentation/view/button view/consultancies.dart';
import '../features/home/presentation/view/button view/course.dart'
    show CoursesView;
import '../features/home/presentation/view/button view/settings.dart';
import '../features/home/presentation/view/button view/universities.dart';
import '../features/home/presentation/view/home_screen.dart';
import '../features/splash/presentation/view/onboardingscreen_view.dart';
import '../features/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String courses = '/courses';
  static const String consultancies = '/consultancies';
  static const String universities = '/universities';
  static const String settings = '/settings';
  static const String sensor = '/sensor';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? name = settings.name;

    if (name == splash) {
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    } else if (name == onboarding) {
      return MaterialPageRoute(builder: (_) => const OnboardingScreenView());
    } else if (name == login) {
      return MaterialPageRoute(builder: (_) => const LoginView());
    } else if (name == signup) {
      return MaterialPageRoute(builder: (_) => const RegisterView());
    } else if (name == home) {
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(
          toggleTheme: MyApp.toggleTheme,
        ),
      );
    } else if (name == courses) {
      return MaterialPageRoute(builder: (_) => const CoursesView());
    } else if (name == consultancies) {
      return MaterialPageRoute(builder: (_) => const ConsultanciesView());
    } else if (name == universities) {
      return MaterialPageRoute(builder: (_) => const UniversitiesView());
    } else if (name == settings) {
      return MaterialPageRoute(
        builder: (_) => const SettingsView(
          onThemeChanged: MyApp.toggleTheme,
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
    }
  }
}
