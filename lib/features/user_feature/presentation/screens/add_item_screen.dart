import 'package:flutter/material.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';
import 'package:sample_app/features/user_feature/presentation/utils/margins.dart';
import 'package:sample_app/features/user_feature/presentation/widget/app_primary_button.dart';

import '../widget/app_text_field.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        title: const Text("Add friend"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              children: [
                const YMargin(50),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: kColorBlue,
                    child: Icon(
                      Icons.person,
                      color: kColorWhite,
                      size: 35,
                    ),
                  ),
                ),
                const YMargin(30),
                TextFieldTile(
                  controller: firstNameController,
                  name: "First name",
                  hintName: "John",
                ),
                const YMargin(30),
                TextFieldTile(
                  controller: lastNameController,
                  name: "Last name",
                  hintName: "Doe",
                ),
                const YMargin(30),
                TextFieldTile(
                  controller: emailController,
                  name: "Email address",
                  hintName: "abc@xyz.com",
                ),
                const YMargin(30),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: TextFieldTile(
                          controller: countryCodeController,
                          name: "Country code",
                          hintName: "+447",
                        )),
                    XMargin(10),
                    Expanded(
                        flex: 3,
                        child: TextFieldTile(
                          controller: phoneNumberController,
                          name: "Phone number",
                          hintName: "1234567890",
                        ))
                  ],
                ),
                const YMargin(30),
                TextFieldTile(
                  controller: addressController,
                  name: "Address",
                  hintName: "abc@xyz.com",
                  maxLines: 2,
                ),
                const YMargin(10),
              ],
            )),
            // Spacer(),
            PrimaryButton(
              text: "Add to friends",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, kDashboard, (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldTile extends StatelessWidget {
  const TextFieldTile({
    Key? key,
    required this.controller,
    required this.name,
    required this.hintName,
    this.maxLines = 1,
    this.verticalPadding = 15,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintName;
  final String name;
  final int? maxLines;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 15),
        ),
        const YMargin(5),
        AppTextField(
          hintText: hintName,
          controller: controller,
          maxLines: maxLines,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        )
      ],
    );
  }
}
