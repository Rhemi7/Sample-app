import 'package:flutter/material.dart';
import 'package:sample_app/features/user_feature/presentation/screens/add_item_screen.dart';
import 'package:sample_app/features/user_feature/presentation/screens/dashboard.dart';
import 'package:sample_app/features/user_feature/presentation/screens/edit_item_screen.dart';
import 'package:sample_app/features/user_feature/presentation/screens/home_screen.dart';
import 'package:sample_app/features/user_feature/presentation/screens/item_screen.dart';
import 'package:sample_app/features/user_feature/presentation/screens/log_in_screen.dart';
import 'package:sample_app/features/user_feature/presentation/screens/sign_up_screen.dart';
import 'package:sample_app/features/user_feature/presentation/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/add_item':
        return MaterialPageRoute(
          builder: (_) => const AddItemScreen(),
        );
      case '/edit_item':
        return MaterialPageRoute(
          builder: (_) => const EditItemScreen(),
        );
      case '/sign_up':
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/item_screen':
        return MaterialPageRoute(
          builder: (_) => const ItemScreen(),
        );
      case '/dash_board':
        return MaterialPageRoute(
          builder: (_) => const Dashboard(),
        );
      default:
        return null;
    }
  }
}
