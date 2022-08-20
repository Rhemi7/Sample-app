import 'package:flutter/material.dart';
import 'package:sample_app/features/authentication_feature/presentation/notifier/authentication_state.dart';
import 'package:sample_app/features/authentication_feature/presentation/provider/provider.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';
import '../../../storage_feature/presentation/widget/app_primary_button.dart';
import '../../../storage_feature/presentation/widget/app_text_field.dart';
import '../../../user_feature/presentation/utils/margins.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authNotifierProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log in",
                style: TextStyle(fontSize: 24),
              ),
              const Spacer(),
              AppTextField(
                hintText: "Email",
                controller: emailController,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                onChanged: (String value) {},
              ),
              const YMargin(15),
              AppTextField(
                hintText: "Password",
                controller: passwordController,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                onChanged: (String value) {},
              ),
              const Spacer(),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final authState = ref.watch(authNotifierProvider);
                  if (authState is AuthenticationLoading) {
                    return PrimaryButton(
                      onPressed: () {

                      },
                      text: "Loading...",
                    );
                  } else if (authState is AuthenticationLoaded) {
                    return PrimaryButton(
                      onPressed: () async {
                        await provider
                            .loginUser(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          if (provider.currentState() is AuthenticationLoaded) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, kDashboard, (route) => false);
                          }
                          else if (provider.currentState()
                              is AuthenticationError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login failed"),
                              ),
                            );
                          }
                        });
                      },
                      text: "Log in",
                    );
                  } else if (authState is AuthenticationError) {
                    return PrimaryButton(
                      onPressed: () async {
                        await provider
                            .loginUser(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          if (provider.currentState() is AuthenticationLoaded) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, kDashboard, (route) => false);
                          } else if (provider.currentState()
                              is AuthenticationError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login failed"),
                              ),
                            );
                          }
                        });
                      },
                      text: "Log in",
                    );
                  }
                  return PrimaryButton(
                    onPressed: () async {
                      await provider
                          .loginUser(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        if (provider.currentState() is AuthenticationLoaded) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, kDashboard, (route) => false);
                        } else if (provider.currentState()
                            is AuthenticationError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login failed"),
                            ),
                          );
                        }
                      });
                    },
                    text: "Log in",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
