// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rite_wayy/location.dart';
import 'package:rite_wayy/util/toast_util.dart';

import 'models/user_model.dart';

class Login extends StatefulWidget {
  Login({Key? key, required this.title}) : super(key: key);
  final String title;
  static UserModel user = UserModel();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    Future signInWithEmailPassword(
        String email, String password, BuildContext context) async {
      await FirebaseFirestore.instance.collection("users").get().then((val) {
        if (val.docs.isNotEmpty) {
          int index = val.docs.length;
          for (var i = 0; i < index; i++) {
            if (email == val.docs[i].data()['email']) {
              if (password == val.docs[i].data()['password']) {
                //Return Bool True(Credentials are Okay) To View class so it can proceed
                Login.user.name = val.docs[i].data()['name'];
                Login.user.email = val.docs[i].data()['email'];
                Login.user.password = val.docs[i].data()['password'];
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => location()),
                    (route) => false);

                break;
              } else {
                ToastUtil.showToast("Login Failed");
              }
            }
          }
        } else {
          //No Document Exists
          ToastUtil.showToast("Login Failed");
        }
      }).catchError((error) {
        ToastUtil.showToast("Firebase Authentication Failed");
      });
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: deviceHeight,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.05,
                vertical: deviceHeight * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: deviceHeight * 0.35,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.08,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: deviceWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.03,
                    child: Text(
                      'Sign in to continue.',
                      style: TextStyle(
                        fontSize: deviceWidth * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: deviceWidth * 0.05),
                      Expanded(
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.04,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  SizedBox(
                    height: deviceHeight * 0.08,
                    width: deviceWidth * 0.9,
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 186, 59),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.015,
                          horizontal: deviceWidth * 0.05,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(deviceWidth * 0.05),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  Row(
                    children: [
                      SizedBox(width: deviceWidth * 0.05),
                      Expanded(
                        child: Text(
                          'PASSWORD',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.04,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  SizedBox(
                    height: 50,
                    width: deviceWidth * 0.9,
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
                        contentPadding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.02,
                          horizontal: deviceWidth * 0.05,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(deviceWidth * 0.05),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.05),
                  SizedBox(
                    width: deviceWidth * 0.8,
                    height: deviceHeight * 0.06,
                    child: ElevatedButton(
                      onPressed: () async {
                        await signInWithEmailPassword(_nameController.text,
                            _passwordController.text, context);
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Log in",
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
          ),
        ),
      ),
    );
  }
}

//i am giving you code of my flutter application screen which is well responsive and accurately fits on every mobile screen , but other screens are not well responsive i am going to provide you a code of my perfectly responsive screen and you need to update other screens which are not accurately responsive acording to this screen ? will you help me with this?

//without mediaquery

// import 'package:flutter/material.dart';
// import 'package:rite_wayy/location.dart';

// class login extends StatelessWidget {
//   const login({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     var _passwordController = TextEditingController();
//     var _emailController = TextEditingController();
//     var _nameController = TextEditingController();

//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 50,
//                 child: Text(
//                   'Login',
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//                 child: Text(
//                   'Sign in to continue.',
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   SizedBox(height: 0),
//                   Text(
//                     '                 NAME',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               SizedBox(
//                 height: 50,
//                 width: 240,
//                 child: TextField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your name',
//                     filled: true,
//                     fillColor: Color.fromARGB(255, 255, 186, 59),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Text(
//                     '                 PASSWORD',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               SizedBox(
//                 height: 50,
//                 width: 240,
//                 child: TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Enter your password',
//                     filled: true,
//                     fillColor: Color.fromARGB(255, 255, 186, 59),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 32),
//               SizedBox(
//                 width: 240,
//                 height: 40,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => location()),
//                     );
//                   },
//                   // ignore: sort_child_properties_last
//                   child: const Text(
//                     "Log in",
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(136, 39, 117, 176),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
