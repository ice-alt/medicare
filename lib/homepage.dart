import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_handymappisioma/camera.dart';
import 'package:flutter_handymappisioma/checkup.dart';
import 'package:flutter_handymappisioma/hospitalmap.dart';
import 'package:flutter_handymappisioma/notes.dart';
import 'package:flutter_handymappisioma/serviceauth/hospital_database.dart';

import 'myprofile.dart';

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  FirebaseDatabase dref = FirebaseDatabase.instance;
  late DatabaseReference dbref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MediCare'),
          backgroundColor: Colors.deepOrange,
        ),
        floatingActionButton: buildCameraButton(),
        body: HomeBody());
  }
}

Widget buildCameraButton() => FloatingActionButton(
      child: Icon(Icons.camera),
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepOrange,
      onPressed: () {
        CameraApp();
      },
    );

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<String>>>(
      future: getSymptoms(),
      builder: (context, snapshot) {
        return Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                child: const Text('My Profile'),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.deepOrange,
                    padding: EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckUp(
                            symtptoms: snapshot.data ?? {},
                          )));
                },
                child: const Text('Check Up'),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.deepOrange,
                    padding: EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  getHospitals().then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Hmap(
                              hm: value.first,
                              // hm: null,
                            )));
                  });
                },
                child: const Text('Find nearest hospital'),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.deepOrange,
                    padding: EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Notes()));
                },
                child: const Text('Notes'),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.deepOrange,
                    padding: EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }
}
