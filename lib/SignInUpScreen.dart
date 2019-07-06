import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/HomeScreen.dart';
import 'package:flutter_to_do_app/SignInPage.dart';
import 'package:flutter_to_do_app/SignUpPage.dart';

class SignInUpScreen extends StatefulWidget {
  @override
  _SignInUpScreenState createState() => _SignInUpScreenState();
}

class _SignInUpScreenState extends State<SignInUpScreen> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: AppTitle(),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                SignInPage(
                  createAccount: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  onSignIn: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                SignUpPage(
                  logIn: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailSection extends StatelessWidget {
  final String title;
  final RichText content;

  const DetailSection({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.0),
        content,
        SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 40.0,
            width: 42.0,
            padding: EdgeInsets.only(left: 8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/icon.png"), fit: BoxFit.fill),
            ),
            child: Text(
              "✓",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            //child: Icon(Icons.check),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "To Do",
            style: TextStyle(
              color: Color(0xFF4ce5ae),
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

