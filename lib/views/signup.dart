import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/resources/strings.dart';
import 'package:my_first_flutter_project/views/helpers.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Image.asset(
                StringUtils.logo,
                width: MediaQuery.of(context).size.width * .2,
                height: MediaQuery.of(context).size.height * .2,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.contains('@') &&
                      value.contains('.') &&
                      value.length > 5) {
                    return null;
                  }

                  return "Invalid email pattern!";
                },
                decoration: const InputDecoration(labelText: "Enter Email"),
              ),
              vSpace,
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name field is empty!";
                  }
                },
                decoration: const InputDecoration(labelText: "Enter Full Name"),
              ),
              vSpace,
              TextFormField(
                decoration: const InputDecoration(labelText: "Enter Password"),
              ),
              vSpace,
              FloatingActionButton.extended(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {}
                },
                label: const Text("Create Account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
