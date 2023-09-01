import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/views/settings/edit_profile.dart';
import 'package:news_app/views/settings/settings.dart';
import 'package:news_app/views/profile/utils/local_data_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? file;
  String? fullName;
  String? bio;
  String? userName;
  String? email;
  String? website;
  String? phone;
  final LocalDataStorage localDataStorage = LocalDataStorage();
  @override
  void initState() {
    super.initState();
    getInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsView()));
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      clipBehavior: Clip.hardEdge,
                      width: 100,
                      height: 100,
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
                  const Column(
                    children: [
                      Text("200"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Followers"),
                    ],
                  ),
                  const Column(
                    children: [
                      Text("200"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Following"),
                    ],
                  ),
                  const Column(
                    children: [
                      Text("20"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("News"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(fullName ?? ''),
            const SizedBox(
              height: 10,
            ),
            Text(bio ?? ""),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfile()));
              },
              child: const Text("Edit Profile"),
            ),
          ],
        ));
  }

  Future<void> getInformation() async {
    final result = await localDataStorage.getInformation();
    if (result != "") {
      Map<String, dynamic> decodedData = jsonDecode(result);
      fullName = decodedData['fullname'];
      file = XFile(decodedData['imagePath']);
      bio = decodedData['bio'];
      userName = decodedData['userName'];
      email = decodedData['email'];
      phone = decodedData['phone'];
      setState(() {});
    }
  }
}
