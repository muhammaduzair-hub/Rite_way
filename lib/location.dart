import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rite_wayy/loc_req.dart';
import 'package:rite_wayy/profile.dart';

class location extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<location> {
  late Completer<GoogleMapController> mapController = Completer();
  Set<Marker> _marker = {};

  final LatLng _center = const LatLng(40.6892, -74.0445);

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    addMarker();
  }

  void addMarker() async {
    BitmapDescriptor bitmap = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        // "assets/car_top.png",
        "assets/avatar.jpg");

    await _markers.add(
      Marker(
          markerId: MarkerId("marker1"),
          position: _center,
          infoWindow: InfoWindow(title: "Custom Marker"),
          icon: bitmap),
    );
    goToPosition();
    setState(() {});
  }

  Future<void> goToPosition() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        // target: LatLng(37.10601957198128, -
        target: _center,
        zoom: 10,
        tilt: 59.440)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(136, 39, 117, 176),
        title: Text(
          "RITEWAY",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add action for Settings icon
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => profile()),
            );
            // TODO: Add action for drawer icon
          },
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _marker,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 10,
            ),
          ),
          // Container(
          //   color: Color.fromARGB(255, 71, 103, 132).withOpacity(0.5),
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loc_req()),
                  );
                  // TODO: Add action for Pick Up Location TextField
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "Choose Pick Up Location",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 255, 199, 59).withOpacity(0.7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(style: BorderStyle.solid)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loc_req()),
                  );
                  // TODO: Add action for Drop Off Location TextField
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "Choose Drop Off Location",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 255, 199, 59).withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          color: Color.fromARGB(174, 30, 94, 143),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.directions_car,
                size: 40,
              ),
              onPressed: () {
                // TODO: Add action for vehicle button
              },
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_month_outlined,
                size: 40,
              ),
              onPressed: () {
                // TODO: Add action for calendar button
              },
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(
                Icons.location_on,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loc_req()),
                );
                // TODO: Add action for location button
              },
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////////////////
///
///
///

//without google map

// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class location extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(136, 39, 117, 176),
//         title: Text(
//           "RITEWAY",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//             letterSpacing: 2,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // TODO: Add action for Settings icon
//             },
//             icon: Icon(
//               Icons.settings,
//               color: Colors.black,
//             ),
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/bg.jpg',
//             fit: BoxFit.cover,
//             height: double.infinity,
//             width: double.infinity,
//           ),
//           Container(
//             color: Color.fromARGB(255, 71, 103, 132).withOpacity(0.5),
//             height: double.infinity,
//             width: double.infinity,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 50),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Choose Pick Up Location",
//                     prefixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor:
//                         Color.fromARGB(255, 255, 199, 59).withOpacity(0.7),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(style: BorderStyle.solid)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Choose Drop Off Location",
//                     prefixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor:
//                         Color.fromARGB(255, 255, 199, 59).withOpacity(0.7),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(style: BorderStyle.solid),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
