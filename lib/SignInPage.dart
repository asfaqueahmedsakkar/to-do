import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/FullButton.dart';
import 'package:flutter_to_do_app/SignInUpScreen.dart';

class SignInPage extends StatefulWidget {
  final Function() createAccount;
  final Function(String email, String password) onSignIn;

  const SignInPage({
    Key key,
    this.createAccount,
    this.onSignIn,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  GlobalKey<FormState> _key;
  bool _autoValidate = false;

  @override
  void initState() {
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    _key = new GlobalKey();
    super.initState();
  }

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
                onTap: widget.createAccount,
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
        Form(
          key: _key,
          autovalidate: _autoValidate,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: _getInputDecoration("Email"),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: _getTextStyle(),
                validator: validateEmail,
              ),
              SizedBox(
                height: 32.0,
              ),
              TextFormField(
                decoration: _getInputDecoration("Password"),
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: _getTextStyle(),
                validator: validatePassword,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 48.0,
        ),
        FullButton(
          onPress: () {
            if (_key.currentState.validate()) {
              widget.onSignIn(
                _emailController.text,
                _passwordController.text.isEmpty
                    ? "abcdefghijklmnopqrstuvwxyz1213"
                    : _passwordController.text,
              );
            } else {
              if (!_autoValidate)
                setState(() {
                  _autoValidate = true;
                });
            }
          },
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

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email address not valid';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password not valid';
    } else {
      return null;
    }
  }
}
