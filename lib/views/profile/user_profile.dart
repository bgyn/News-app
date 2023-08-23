import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/views/component/button.dart';
import 'package:news_app/views/component/snack_bar.dart';
import 'package:news_app/views/component/text_field.dart';
import 'package:news_app/views/main/pages/homa_page.dart';
import 'package:news_app/views/profile/utils/local_data_storage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final LocalDataStorage localDataStorage = LocalDataStorage();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? file;

  getImageFromGallery() async {
    file = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getInformation();
  }

  Future<void> getInformation() async {
    final result = await localDataStorage.getInformation();
    if (result != "") {
      Map<String, dynamic> decodedData = jsonDecode(result);
      _usernameController.text = decodedData['username'];
      _fullNameController.text = decodedData['fullname'];
      _emailAddressController.text = decodedData['email'];
      _phoneNumberController.text = decodedData['phone'];
      file = XFile(decodedData['imagePath']);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Fill your profile"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          getImageFromGallery();
                        },
                        child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: 140,
                            height: 140,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: file == null
                                ? const SizedBox()
                                : Image.file(
                                    File(file!.path),
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: const Icon(
                            Icons.photo_camera,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      textController: _usernameController, text: 'Username'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      textController: _fullNameController, text: 'Full Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      textController: _emailAddressController,
                      text: 'Email Address*'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                      textController: _phoneNumberController,
                      text: 'Phone Number*'),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Visibility(
          // visible: !keyboard,
          child: Visibility(
            visible: !showFab,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: GestureDetector(
                onTap: () async {
                  if (_usernameController.text == "" ||
                      _fullNameController.text == "" ||
                      _emailAddressController.text == "" ||
                      _phoneNumberController.text == "" ||
                      file == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      showSnackBar('Please fill out the all the fields!!'),
                    );
                  } else {
                    Map<String, dynamic> data = {
                      'username': _usernameController.text,
                      'fullname': _fullNameController.text,
                      'email': _emailAddressController.text,
                      'phone': _phoneNumberController.text,
                      'imagePath': file!.path,
                    };
                    final encodedData = jsonEncode(data);
                    localDataStorage.storeInfomation(encodedData);
                    localDataStorage.isNewUser(false);
                    final route =
                        MaterialPageRoute(builder: (context) => HomePage());
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                  }
                },
                child: const ButtonWidget(text: 'Next'),
              ),
            ),
          ),
        ));
  }
}
