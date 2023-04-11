// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rite_wayy/location.dart';
import 'package:rite_wayy/login.dart';
import 'package:rite_wayy/models/user_model.dart';
import 'package:rite_wayy/util/toast_util.dart';

class create_acc extends StatefulWidget {
  create_acc({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<create_acc> createState() => _create_accState();
}

class _create_accState extends State<create_acc> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  bool obscureText = true;

  Future signUpWithEmailPassword(BuildContext context) async {
    RegExp emailExp = RegExp(r'^[a-zA-Z0-9._%+-]+@cust\.com$');
    if (emailExp.hasMatch(_emailController.text)) {
      int emailAlreadyExist = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: _emailController.text)
          .get()
          .then((value) => value.size);
      if (emailAlreadyExist > 0) {
        ToastUtil.showToast("Email Already Exist");
        return;
      }

      await FirebaseFirestore.instance.collection("users").add({
        "name": _nameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "address": "Address NotFound",
        "type": "Type NotFound",
        "imgUrl": "",
        "age": -1,
        "cnic": -1,
        "timestamp": new DateTime.now()
      }).then((response) {
        Login.user = UserModel(
            name: _nameController.text,
            password: _passwordController.text,
            email: _emailController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => location()),
            (route) => false);
      }).catchError(
        (error) => ToastUtil.showToast("Something went wrong"),
      );
    } else {
      ToastUtil.showToast("Invalid Email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 30,
              child: Text(
                'Create new',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Text(
                'Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Text(
                'Alredy Registered? Log in here.',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(height: 0),
                Text(
                  'NAME',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                filled: true,
                fillColor: Color.fromARGB(255, 255, 186, 59),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'EMAIL',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                filled: true,
                fillColor: Color.fromARGB(255, 255, 186, 59),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'PASSWORD',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  suffix: IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => setState(() {
                            obscureText = !obscureText;
                          })),
                  hintText: 'Enter your password',
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 186, 59),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 240,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  await signUpWithEmailPassword(context);
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(136, 39, 117, 176),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
