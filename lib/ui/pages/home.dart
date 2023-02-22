import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:get/get.dart';

import 'package:my_first_flutter_project/controllers/auth.dart';
import 'package:my_first_flutter_project/controllers/chat_controller.dart';
import 'package:my_first_flutter_project/database/user.dart';
import 'package:my_first_flutter_project/resources/strings.dart';
import 'package:my_first_flutter_project/ui/pages/profile.dart';
import 'package:my_first_flutter_project/ui/pages/search.dart';

class HomePage extends StatefulWidget {
  static String route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = 'inital';
  @override
  void initState() {
    super.initState();
    _controller.loadUser();
  }

  late final AuthController _controller = Get.find();
  @override
  void dispose() {
    //close it here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
          ),
          onPressed: () {
            Get.toNamed(ProfilePage.route);
          },
        ),
        title: Text(_controller.userModel.value.name),
        actions: [
          IconButton(
            onPressed: () async {
              _controller.logout();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: PaginateFirestore(
          //item builder type is compulsory.
          itemBuilder: (context, documentSnapshots, index) {
            final data = documentSnapshots[index].data() as Map?;
            return ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: data == null ? Text('Error in data') : Text(data['name']),
              subtitle: Text(documentSnapshots[index].id),
            );
          },
          // orderBy is compulsory to enable pagination
          query: FirebaseFirestore.instance
              .collection(StringUtils.kUsers)
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection(StringUtils.kFriends)
              .orderBy('name'),
          //Change types accordingly
          itemBuilderType: PaginateBuilderType.listView,
          // to fetch real-time data
          isLive: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var user = await Get.toNamed(SearchPage.route);
          if (user != null) {
            //user has been selected
            print(user);
            ChatController().addPersonToChat(user as UserModel);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
