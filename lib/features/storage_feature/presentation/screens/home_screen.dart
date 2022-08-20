import 'package:flutter/material.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';

import '../widget/friends_tile_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, kAddItemScreen);
        },
        backgroundColor: kColorBlue,
        child: const Icon(Icons.person_add_alt),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: const [
              FriendsTileWidget(
                firstName: "John",
                lastName: "Doe",
                phoneNumber: "123456789",
                countryCode: "+447",
              )
            ],
          ),
        ),
      ),
    );
  }
}

