import 'package:flutter/material.dart';
import 'package:sample_app/features/storage_feature/data/model/friend_model.dart';
import '../../../user_feature/presentation/utils/constants.dart';
import '../../../user_feature/presentation/utils/margins.dart';
import '../provider/provider.dart';
import '../widget/app_primary_button.dart';
import 'add_item_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditItemScreen extends StatefulWidget {
  EditItemScreen({Key? key, this.friend, this.index}) : super(key: key);
  final FriendModel? friend;
  final int? index;

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    firstNameController.text = "${widget.friend?.firstName}";
    lastNameController.text = "${widget.friend?.lastName}";
    emailController.text = "${widget.friend?.email}";
    addressController.text = "${widget.friend?.address}";
    phoneNumberController.text = "${widget.friend?.phoneNumber}";
    countryCodeController.text = "${widget.friend?.countryCode}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        title: const Text("Edit"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_rounded)),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final storageProvider =
                  ref.watch(storageNotifierProvider.notifier);

              return Column(
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
                  PrimaryButton(
                    text: "Save",
                    onPressed: () async {
                      await storageProvider
                          .edit(
                              model: FriendModel(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  address: addressController.text,
                                  countryCode: countryCodeController.text,
                                  phoneNumber: phoneNumberController.text),
                              index: widget.index!)
                          .then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, kDashboard, (route) => false);
                      });
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}
