import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/FullButton.dart';
import 'package:flutter_to_do_app/HomeScreen.dart';
import 'package:flutter_to_do_app/SignInUpScreen.dart';

class SplashScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    FirebaseUser _user;
    _auth.currentUser().then((user) {
      _user = user;
    });
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: 120.0,
                  width: 120.0,
                  padding: EdgeInsets.only(left: 24.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/icon.png"), fit: BoxFit.fill),
                  ),
                  child: Text(
                    "✓",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 52.0,
                    ),
                  ),
                  //child: Icon(Icons.check),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    "The only thing more important than your to-do list is your to-be list.",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            flex: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: FullButton(
              color: Color(0xFF4ce5ae),
              title: "Let's Start",
              onPress: () {
                if (_user == null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInUpScreen(),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
