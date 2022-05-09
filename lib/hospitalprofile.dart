import 'package:flutter/material.dart';
import 'package:flutter_handymappisioma/hospitalservices.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HospitalProfile extends StatefulWidget {
  // final Worker worker;
  final HospitalModel hm;

  const HospitalProfile({Key? key, required this.hm}) : super(key: key);

  @override
  _HospitalProfileState createState() => _HospitalProfileState();
}

class _HospitalProfileState extends State<HospitalProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/mclogo1.png'),
            ),
            // Text(
            //   widget.worker.name,
            //   style: TextStyle(
            //     fontFamily: 'Lobster',
            //     fontSize: 30.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            // ),
            Text(widget.hm.phoneNumber,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange)),
            ElevatedButton(
              onPressed: () {
                _callNumber();
              },
              child: Text("Call"),
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
      ),
    );
  }

  _callNumber() async {
    String number = widget.hm.phoneNumber; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
