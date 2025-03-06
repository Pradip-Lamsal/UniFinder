import 'package:bus_application/features/splash/presentation/view/onboardingscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/view_model/login/login_bloc.dart';
import 'di/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LoginBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Customer Management',
        home: BlocProvider.value(
          value: getIt<LoginBloc>(),
          child: const OnboardingScreenView(),
        ),
      ),
    );
  }
}
