import 'package:flutter/material.dart';
import 'package:flutter_handymappisioma/serviceauth/auth.dart';
import 'package:flutter_handymappisioma/signup.dart';

import 'homepage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  controller: email,
                ),
                const SizedBox(
                  height: 30,
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  controller: password,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  // child: const Text('Next'),
                  // color: Theme.of(context).primaryColor,
                  // textColor: Colors.white,
                  onPressed: () {
                    _formKey.currentState!.validate();
                    signIn(email: email.text, password: password.text)
                        .then((value) {
                      if (value != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyHomePage()));
                        //   Navigator.pushNamed(context, '/homepage');
                      }
                    });
                  },
                  child: const Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      primary: Colors.deepOrange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 16),
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                ElevatedButton(
                  // child: const Text('Sign Up'),
                  // color: Theme.of(context).primaryColor,
                  // textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: const Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      primary: Colors.deepOrange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
