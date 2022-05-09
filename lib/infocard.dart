import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  //const InfoCard({Key? key}) : super(key: key);

  late final String text;
  late final IconData icon;
  // late Function onPressed;

  InfoCard({required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Card(
        color: Colors.deepOrange,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
