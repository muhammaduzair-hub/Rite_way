// ignore_for_file: sort_child_properties_last

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rite_wayy/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? const Text("Something went wrong")
              : MaterialApp(
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home: const MyHomePage(title: 'My Home Page'),
                );
        });
  }
}

//  Row(
//                 children: [
//                   SizedBox(height: 30),
//                   Text(
//                     'EMAIL',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
