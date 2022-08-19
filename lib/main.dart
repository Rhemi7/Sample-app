import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/features/user_feature/presentation/screens/add_item_screen.dart';
import 'package:sample_app/features/user_feature/presentation/screens/dashboard.dart';
import 'package:sample_app/features/user_feature/presentation/screens/item_screen.dart';
import 'package:sample_app/features/user_feature/presentation/screens/sign_up_screen.dart';
import 'features/user_feature/presentation/app_router.dart';
import 'features/user_feature/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( ProviderScope(child: MyApp(),));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      home: const SignUpScreen(),
    );
  }
}
