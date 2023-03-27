// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class loc_req extends StatelessWidget {
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
                          hintText: 'Select Pick Up Location',
                          focusColor: Colors.yellow, // update this line
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(style: BorderStyle.solid),
                          ),
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        items: [
                          const DropdownMenuItem(
                            child: Text('Location 1'),
                            value: 'location_1',
                          ),
                          const DropdownMenuItem(
                            child: Text('Location 2'),
                            value: 'location_2',
                          ),
                          const DropdownMenuItem(
                            child: Text('Location 3'),
                            value: 'location_3',
                          ),
                        ],
                        onChanged: (value) {
                          // Handle value selection
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Select Drop Off Location',
                          focusColor: Colors.yellow, // update this line
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(style: BorderStyle.solid),
                          ),
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        items: [
                          const DropdownMenuItem(
                            child: Text('Location 1'),
                            value: 'location_1',
                          ),
                          const DropdownMenuItem(
                            child: Text('Location 2'),
                            value: 'location_2',
                          ),
                          const DropdownMenuItem(
                            child: Text('Location 3'),
                            value: 'location_3',
                          ),
                        ],
                        onChanged: (value) {
                          // Handle value selection
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => location()),
                        // );
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
