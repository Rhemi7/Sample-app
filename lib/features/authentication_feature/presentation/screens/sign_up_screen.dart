import 'package:flutter/material.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';
import '../../../storage_feature/presentation/provider/provider.dart';
import '../../../storage_feature/presentation/widget/app_primary_button.dart';
import '../../../storage_feature/presentation/widget/app_text_field.dart';
import '../../../user_feature/presentation/utils/margins.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifier/authentication_notifier/authentication_state.dart';
import '../provider/auth_provider.dart';
import '../provider/user_data_provider.dart';

class SignUpScreen extends ConsumerWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authNotifierProvider.notifier);
    final storageProvider = ref.watch(storageNotifierProvider.notifier);
    final userProvider = ref.watch(userDataNotifierProvider.notifier);


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
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
              const YMargin(15),
              AppTextField(
                hintText: "First name",
                controller: firstNameController,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                onChanged: (String value) {},
              ),
              const YMargin(15),
              AppTextField(
                hintText: "Last name",
                controller: lastNameController,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                onChanged: (String value) {},
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, kLoginScreen);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Log in"),
                    ),
                  )
                ],
              ),
              const YMargin(10),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final authState = ref.watch(authNotifierProvider);
                  if (authState is AuthenticationLoading) {
                    return PrimaryButton(
                      onPressed: () {},
                      text: "Loading...",
                    );
                  } else if (authState is AuthenticationLoaded) {
                    return PrimaryButton(
                      onPressed: () async {
                        await provider
                            .registerUser(
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text)
                            .then((value) {
                          if (provider.currentState() is AuthenticationLoaded) {
                            storageProvider.getFriends().then((value) {
                              userProvider.getUserData();

                              Navigator.pushNamedAndRemoveUntil(
                                  context, kDashboard, (route) => false);
                            });
                          } else if (provider.currentState()
                              is AuthenticationError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registration failed"),
                              ),
                            );
                          }
                        });
                      },
                      text: "Sign up",
                    );
                  } else if (authState is AuthenticationError) {
                    return PrimaryButton(
                      onPressed: () async {
                        await provider
                            .registerUser(
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text)
                            .then((value) {
                          if (provider.currentState() is AuthenticationLoaded) {
                            storageProvider.getFriends().then((value) {
                              userProvider.getUserData();

                              Navigator.pushNamedAndRemoveUntil(
                                  context, kDashboard, (route) => false);
                            });
                          } else if (provider.currentState()
                              is AuthenticationError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registration failed"),
                              ),
                            );
                          }
                        });
                      },
                      text: "Sign up",
                    );
                  }
                  return PrimaryButton(
                    onPressed: () async {
                      await provider
                          .registerUser(
                              email: emailController.text,
                              password: passwordController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text)
                          .then((value) {
                        if (provider.currentState() is AuthenticationLoaded) {
                          storageProvider.getFriends().then((value) {
                            userProvider.getUserData();

                            Navigator.pushNamedAndRemoveUntil(
                                context, kDashboard, (route) => false);
                          });
                        } else if (provider.currentState()
                            is AuthenticationError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Registration failed"),
                            ),
                          );
                        }
                      });
                    },
                    text: "Sign up",
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
