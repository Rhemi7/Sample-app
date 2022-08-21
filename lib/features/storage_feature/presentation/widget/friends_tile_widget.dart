import 'package:flutter/material.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/presentation/screens/item_screen.dart';
import '../../../user_feature/presentation/utils/constants.dart';

class FriendsTileWidget extends StatelessWidget {
  final FriendModel friend;
  final int index;

  const FriendsTileWidget({
    Key? key,
    required this.friend,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ItemScreen(friend: friend, index: index)));
        },
        leading: const CircleAvatar(
            backgroundColor: kColorBlue,
            child: Icon(Icons.person, color: kColorWhite,)),
        title: Text("${friend.firstName} ${friend.lastName}"),
        subtitle: Text("${friend.countryCode} ${friend.phoneNumber}"),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, color: kColorBlue,),
      ),
    );
  }
}
