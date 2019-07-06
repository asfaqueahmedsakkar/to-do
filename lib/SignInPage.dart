import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/FullButton.dart';
import 'package:flutter_to_do_app/SignInUpScreen.dart';

class SignInPage extends StatelessWidget {
  final Function() createAccount;
  final Function() onSignIn;

  const SignInPage({
    Key key,
    this.createAccount,
    this.onSignIn,
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
                "Still without an account? ",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              GestureDetector(
                onTap: createAccount,
                child: Container(
                  color: Colors.transparent,
                  child: Text(
                    "Click here.",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.lightBlueAccent,
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
          title: "Hello!",
          content: RichText(
            text: TextSpan(
              text: "To access ",
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
          height: 48.0,
        ),
        FullButton(
          onPress: onSignIn,
          title: "Log in",
          color: Color(0xFF4ce5ae),
        ),
        SizedBox(
          height: 32.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Forgot Password? ",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Click here.",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
