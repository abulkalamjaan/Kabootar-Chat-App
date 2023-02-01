import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = 'inital';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      data = ModalRoute.of(context)?.settings.arguments as String;
      setState(() {});
    });
  }

  @override
  void dispose() {
    //close it here
    super.dispose();
  }

  Future<List<String>> loadNamesFromDB() async {
    //perform networks calls or db tasks
    List<String> data = [];
    //query

    for (int i = 0; i < 51; i++) {
      data.add(i.toString());
    }

    return Future.value(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
            Text("TEXT 1 "),
          ],
        ),
      ),
    );
  }
}
