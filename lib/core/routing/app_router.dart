import 'package:daktor/core/routing/routes.dart';
import 'package:daktor/features/login/ui/widgets/login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const Scaffold());

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('No route here !'))),
        );
    }
  }
}
