// ignore_for_file: sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'models/route_point.dart';

class loc_req extends StatefulWidget {
  List<RoutePoint> points = [];

  @override
  State<loc_req> createState() => _loc_reqState();
}

class _loc_reqState extends State<loc_req> {
  late Stream<QuerySnapshot> _collectionStream;
  Future getRoutes() async {
    _collectionStream =
        await FirebaseFirestore.instance.collection("routePoints").snapshots();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(227, 39, 103, 151),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Processing Your Request",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 255, 177, 59),
                  size: 50,
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 177, 59),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(2, 39, 102, 151),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabled: false,
                          hintText: 'Cust',
                          hintStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          focusColor: Colors.yellow, // update this line
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(style: BorderStyle.solid),
                          ),
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        items: [
                          // const DropdownMenuItem(
                          //   child: Text('Cust'),
                          //   value: 'Cust',
                          // ),
                        ],
                        onChanged: (value) {
                          // Handle value selection
                        },
                        value: "Cust",
                      ),
                      const SizedBox(height: 10),
                      StreamBuilder<QuerySnapshot>(
                        stream: _collectionStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasError ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting) return Text("");
                          final List<QueryDocumentSnapshot<Object?>> documents =
                              snapshot.data!.docs;
                          // widget.points = documents
                          //     .map((e) => RoutePoint.fromJson(
                          //         e.data as Map<String, dynamic>))
                          //     .toList();
                          return DropdownButtonFormField<Object>(
                            decoration: InputDecoration(
                              hintText: 'Select Drop Off Location',
                              hintStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              focusColor: Colors.yellow,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(style: BorderStyle.solid),
                              ),
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            items: documents.map((e) {
                              return DropdownMenuItem(
                                child: Text(e["name"]),
                                value: e["name"],
                              );
                            }).toList(),
                            onChanged: (value) {
                              // Handle value selection
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(137, 100, 142, 174),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
