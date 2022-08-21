import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/features/authentication_feature/presentation/provider/user_data_provider.dart';
import 'package:sample_app/features/user_feature/presentation/utils/margins.dart';
import '../../../storage_feature/presentation/provider/provider.dart';
import '../../../user_feature/presentation/utils/constants.dart';
import '../../data/model/user_data.dart';
import '../notifier/user_data_notifier/user_data_state.dart';

class ProfileScreen extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageProvider = ref.watch(storageNotifierProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const YMargin(50),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final userState = ref.watch(userDataNotifierProvider);
                if (userState is UserDataLoading) {
                  return const CircularProgressIndicator();
                } else if (userState is UserDataLoaded) {
                  UserData data = userState.data;
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 20),
                        ),
                        const YMargin(10),
                        Text(
                          data.users![0].displayName!,
                          style: const TextStyle(fontSize: 25),
                        ),
                        const YMargin(40),
                        const Text(
                          "Email",
                          style: TextStyle(fontSize: 20),
                        ),
                        const YMargin(10),
                        Text(
                          data.users![0].email!,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  );
                } else if (userState is UserDataError) {
                  return const Text("Email could not be loaded");
                }
                return const Text("");
              },
            ),
            const Spacer(),
            ListTile(
              onTap: () {
                storageProvider.logout();
                Navigator.pushNamedAndRemoveUntil(context, kLoginScreen, (route) => false);
              },
              title: const Text(
                "Log out",
                style: TextStyle(fontSize: 25),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }
}
