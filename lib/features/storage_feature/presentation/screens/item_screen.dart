import 'package:flutter/material.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/presentation/screens/edit_item_screen.dart';
import '../../../user_feature/presentation/utils/constants.dart';
import '../../../user_feature/presentation/utils/margins.dart';
import '../provider/provider.dart';
import '../widget/app_primary_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({Key? key, this.friend, this.index}) : super(key: key);
  final FriendModel? friend;
  final int? index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(storageNotifierProvider.notifier);

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
          IconButton(
              onPressed: () async {
                await provider.deleteFriendFromList(index!).then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, kDashboard, (route) => false);
                });
              },
              icon: const Icon(Icons.delete)),
        ],
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
                ItemWidget(
                  title: "First name",
                  value: "${friend?.firstName}",
                ),
                const YMargin(30),
                ItemWidget(
                  title: "Last name",
                  value: "${friend?.lastName}",
                ),
                const YMargin(30),
                ItemWidget(
                  title: "Email address",
                  value: "${friend?.email}",
                ),
                const YMargin(30),
                ItemWidget(
                  title: "Phone number",
                  value: "${friend?.countryCode} ${friend?.phoneNumber}",
                ),
                const YMargin(30),
                ItemWidget(
                  title: "Address",
                  value: "${friend?.address}",
                ),
                const YMargin(10),
              ],
            )),
            PrimaryButton(
              text: "Edit",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => EditItemScreen(
                              friend: friend,
                          index: index,
                            )));
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
