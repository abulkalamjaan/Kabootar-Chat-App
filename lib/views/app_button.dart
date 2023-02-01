import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String title;
  final onTap;
  const AppButton({super.key, required this.title, required this.onTap});

  @override
  State<AppButton> createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  late String title = widget.title;
  bool busy = false;

  makeButtonBusy() {
    setState(() {
      busy = true;
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        busy = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: busy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width * .5,
              height: 50,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
