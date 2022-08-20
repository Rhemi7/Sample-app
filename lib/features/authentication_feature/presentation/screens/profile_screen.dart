import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/authentication_state.dart';
import 'package:sample_app/features/authentication_feature/presentation/provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final authState = ref.watch(authNotifierProvider);
            if (authState is AuthenticationLoading) {
              return const CircularProgressIndicator();
            } else if (authState is AuthenticationLoaded) {
              email = authState.email;
              return Text(email!);
            } else if (authState is AuthenticationError) {
              return const Text("Email could not be loaded");
            }
            return const Text("");
          },
        ),
      ),
    );
  }
}
