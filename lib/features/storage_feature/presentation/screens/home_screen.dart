import 'package:flutter/material.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import 'package:sample_app/features/storage_feature/presentation/notifier/storage_state.dart';
import 'package:sample_app/features/storage_feature/presentation/provider/provider.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/features/user_feature/presentation/utils/margins.dart';
import '../widget/friends_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   context.read()
    // });

    super.initState();
  }
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              children: [
                // const YMargin(50),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    final storageState = ref.watch(storageNotifierProvider);
                    if (storageState is StorageLoading) {
                      return const CircularProgressIndicator();
                    } else if (storageState is StorageLoaded) {
                      return ListView.separated(
                          itemCount: storageState.friends.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            FriendModel friend = storageState.friends[index];
                            return FriendsTileWidget(friend: friend, index: index,);
                          }, separatorBuilder: (BuildContext context, int index) {
                            return const YMargin(15);
                      },);
                    } else if (storageState is StorageError) {
                      return Center(
                        child: Text(storageState.message.toString()),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
