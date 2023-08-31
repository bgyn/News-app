import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/views/component/button.dart';
import 'package:news_app/views/component/snack_bar.dart';
import 'package:news_app/views/component/text_field.dart';
import 'package:news_app/views/main/pages/main_page.dart';
import 'package:news_app/views/profile/utils/local_data_storage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    super.key,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _bioController = TextEditingController();
  final _websiteController = TextEditingController();
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
      _bioController.text = decodedData['bio'];
      _websiteController.text = decodedData['website'];
      file = XFile(decodedData['imagePath']);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fill your profile"),
        actions: [
          IconButton(
              onPressed: () {
                saveInfo();
              },
              icon: const Icon(Icons.check))
        ],
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
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  textController: _bioController,
                  text: 'bio',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  textController: _websiteController,
                  text: 'Website',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveInfo() async {
    if (_usernameController.text == "" ||
        _fullNameController.text == "" ||
        _emailAddressController.text == "" ||
        _phoneNumberController.text == "" ||
        _bioController.text == "" ||
        _websiteController.text == "" ||
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
        'bio': _bioController.text,
        'website': _websiteController.text,
      };
      final encodedData = jsonEncode(data);
      localDataStorage.storeInfomation(encodedData);
      final route = MaterialPageRoute(builder: (context) => const MainPage());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    }
  }
}
