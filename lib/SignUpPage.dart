import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/FullButton.dart';
import 'package:flutter_to_do_app/SignInUpScreen.dart';

class SignUpPage extends StatelessWidget {
  final Function() logIn;
  final Function() onSignUp;

  const SignUpPage({
    Key key,
    @required this.logIn,
    this.onSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: _populatePage(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Already have an account? ",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              GestureDetector(
                onTap: logIn,
                child: Container(
                  color: Colors.transparent,
                  child: Text(
                    "Click here.",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.w300,
    );
  }

  InputDecoration _getInputDecoration(String hint) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w300,
        fontSize: 12.0,
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 0.5,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 0.5,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
    );
  }

  Widget _populatePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DetailSection(
          title: "Sign up!",
          content: RichText(
            text: TextSpan(
              text: "To create ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
              ),
              children: [
                TextSpan(
                  text: "Your Account\n",
                  style: TextStyle(
                    color: Color(0xFF4ce5ae),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: "please provide the following information.",
                ),
              ],
            ),
          ),
        ),
        TextFormField(
          decoration: _getInputDecoration("Email"),
          style: _getTextStyle(),
        ),
        SizedBox(
          height: 32.0,
        ),
        TextFormField(
          decoration: _getInputDecoration("Password"),
          style: _getTextStyle(),
        ),
        SizedBox(
          height: 32.0,
        ),
        TextFormField(
          decoration: _getInputDecoration("Confirm Password"),
          style: _getTextStyle(),
        ),
        SizedBox(
          height: 48.0,
        ),
        FullButton(
            onPress: onSignUp, title: "Sign up", color: Colors.lightBlueAccent),
        SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
