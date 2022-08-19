import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/margins.dart';
import '../widget/app_primary_button.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorBlue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_rounded)),
        title: const Text("Friend"),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, kDashboard, (route) => false);
          }, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              children: const [
                YMargin(50),
                Center(
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
                YMargin(30),
                ItemWidget(
                  title: "First name",
                  value: "John",
                ),
                YMargin(30),
                ItemWidget(
                  title: "Last name",
                  value: "Doe",
                ),
                YMargin(30),
                ItemWidget(
                  title: "Email address",
                  value: "abc@xyz.com",
                ),
                YMargin(30),
                ItemWidget(
                  title: "Phone number",
                  value: "+447123456789",
                ),
                YMargin(30),
                ItemWidget(
                  title: "Address",
                  value: "...",
                ),
                YMargin(10),
              ],
            )),
            // Spacer(),
            PrimaryButton(
              text: "Edit",
              onPressed: () {
                Navigator.pushNamed(context, kEditItemScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.value, required this.title})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        const YMargin(5),
        Text(
          value,
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
