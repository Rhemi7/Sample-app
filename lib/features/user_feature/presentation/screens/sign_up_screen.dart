import 'package:flutter/material.dart';
import 'package:sample_app/features/user_feature/presentation/screens/dashboard.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';

import '../utils/margins.dart';
import '../widget/app_primary_button.dart';
import '../widget/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              const Spacer(),
              PrimaryButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, kDashboard, (route) => false);
                },
                text: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
