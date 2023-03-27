import 'package:flutter/material.dart';
import 'package:rite_wayy/create_acc.dart';
import 'package:rite_wayy/login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: screenWidth * 0.5,
              height: screenHeight * 0.3,
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: screenHeight * 0.045, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "As",
              style: TextStyle(
                  fontSize: screenHeight * 0.02, color: Colors.black54),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => create_acc(title: 'Driver')),
                );
              },
              child: Text(
                "DRIVER",
                style: TextStyle(
                    fontSize: screenHeight * 0.014, color: Colors.black54),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 186, 59),
                minimumSize: Size(screenWidth * 0.5, screenHeight * 0.075),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.025),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => create_acc(title: 'Student')),
                );
              },
              child: Text(
                "STUDENT",
                style: TextStyle(
                    fontSize: screenHeight * 0.014, color: Colors.black54),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 186, 59),
                minimumSize: Size(screenWidth * 0.5, screenHeight * 0.075),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.025),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => login(
                            title: '',
                          )),
                );
              },
              child: Text(
                "Already Registered? Log in here",
                style: TextStyle(fontSize: screenHeight * 0.01),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Without mediaquery

// ignore_for_file: sort_child_properties_last, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:rite_wayy/create_acc.dart';
// import 'package:rite_wayy/login.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(
//               'assets/logo.png',
//               width: 150,
//               height: 10,
//             ),
//             const SizedBox(height: 120),
//             const Text(
//               "Sign Up",
//               style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "As",
//               style: TextStyle(fontSize: 20, color: Colors.black54),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const create_acc(title: 'hh')),
//                 );
//               },
//               // ignore: sort_child_properties_last
//               child: const Text(
//                 "DRIVER",
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 255, 186, 59),
//                 minimumSize: const Size(240, 45),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const create_acc(title: 'hh')),
//                 );
//               },
//               child: const Text(
//                 "STUDENT",
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromARGB(255, 255, 186, 59),
//                 minimumSize: const Size(240, 45),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => login(title: '')),
//                 );
//               },
//               child: const Text(
//                 "Already Registered? Log in here",
//                 style: TextStyle(fontSize: 10),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
