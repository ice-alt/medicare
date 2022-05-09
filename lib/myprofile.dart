import 'package:flutter/material.dart';

import 'infocard.dart';

class MyProfile extends StatefulWidget {
  // const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildTop(),
        buildContent(),
      ],
    ));
  }
}

Widget buildTop() {
  final top = coverHeight - (profileHeight / 2);
  final bottom = profileHeight / 2;

  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
          margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
      Positioned(
        top: top,
        child: buildProfileImage(),
      ),
      //profileDetail(),
    ],
  );
}

final double coverHeight = 280;

Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.asset(
        'images/mclogo1.png',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );

final double profileHeight = 144;

Widget buildProfileImage() => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: AssetImage('images/mclogo1.png'),
    );

// Widget profileDetail() => Scaffold(
//     body: Column(
//     children: <Widget>[
//       InfoCard(text: "name", icon: Icons.person),
//       InfoCard(text: "email", icon: Icons.email),
//     ],
//   ),);

Widget buildContent() => Column(
      children: <Widget>[
        InfoCard(text: "name", icon: Icons.person),
        InfoCard(text: "email", icon: Icons.email),
      ],
    );
