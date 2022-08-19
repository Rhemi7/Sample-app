import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FriendsTileWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String countryCode;
  final String phoneNumber;

  const FriendsTileWidget({
    Key? key,
    required this.countryCode,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, kItemScreen);
        },
        leading: const CircleAvatar(
            backgroundColor: kColorBlue,
            child: Icon(Icons.person, color: kColorWhite,)),
        title: Text("$firstName $lastName"),
        subtitle: Text("$countryCode $phoneNumber"),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, color: kColorBlue,),
      ),
    );
  }
}
