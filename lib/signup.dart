import 'package:flutter/material.dart';
import 'package:flutter_handymappisioma/serviceauth/auth.dart';
import 'package:flutter_handymappisioma/signin.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUp extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Sign Up'),
      ),
      backgroundColor: Colors.white,
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
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  controller: name,
                ),
                const SizedBox(
                  height: 30,
                ),
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
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                  controller: phoneNo,
                ),
                const SizedBox(
                  height: 30,
                ),
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
                  height: 10,
                ),
                // const Text(
                //     "By proceeding, you consent to get calls, WhatsApp,\nSMS messages or email, including automated means,\nfrom HandyMapp."),
                ElevatedButton(
                  // child: const Text('Next'),
                  // color: Theme.of(context).primaryColor,
                  // textColor: Colors.white,
                  onPressed: () {
                    _formKey.currentState!.validate();
                    signUp(
                            name: name.text,
                            email: email.text,
                            phoneNo: phoneNo.text,
                            password: password.text)
                        .then((value) {
                      if (value != null) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignIn()));
                      }
                    });
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
