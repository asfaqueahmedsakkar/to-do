import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/AddTaskPage.dart';
import 'package:flutter_to_do_app/CategoryModel.dart';
import 'package:flutter_to_do_app/CategoryWithCountModel.dart';
import 'package:flutter_to_do_app/Dialog/flutter_dialog.dart';
import 'package:flutter_to_do_app/HomePage.dart';
import 'package:flutter_to_do_app/SignInUpScreen.dart';
import 'package:flutter_to_do_app/SplashScreen.dart';
import 'package:flutter_to_do_app/TodaysTaskPage.dart';
import 'package:flutter_to_do_app/TodoTask.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 0;
  List<CategoryWithCountModel> _models;
  List<CategoryModel> _categories;
  List<TodoTask> _tasks;
  PageController _pageController;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FlutterDialogState> _dialogKey;

  @override
  void initState() {
    super.initState();
    _models = new List();
    _categories = new List();
    _pageController = new PageController();
    _tasks = new List();
    _dialogKey = new GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    _populateModel();
    return FlutterDialog(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: AppTitle(),
          actions: <Widget>[
            IconButton(
              tooltip: "Log out",
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.grey,
                size: 30.0,
              ),
              onPressed: () async {
                _dialogKey.currentState.showDialog(
                  title: Text("My To Do"),
                  content: Text("Signing out"),
                );
                await _auth.signOut();
                _dialogKey.currentState.hide();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            unselectedFontSize: 10,
            selectedFontSize: 12,
            unselectedItemColor: Colors.grey,
            currentIndex: id,
            onTap: (id) {
              setState(() {
                _pageController.jumpToPage(id);
                this.id = id;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                title: Text("Add Task"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_check),
                title: Text("Tasks"),
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(models: _models),
            AddTaskPage(categories: _categories),
            TodaysTaskPage(
              tasks: _tasks,
            ),
          ],
        ),
      ),
      key: _dialogKey,
    );
  }

  void _populateModel() {
    _models.clear();
    _categories.clear();
    _tasks.clear();
    _categories.add(
      CategoryModel(
        backgroundColor: Colors.orange,
        categoryName: "Work",
        icon: MdiIcons.folderOpenOutline,
      ),
    );
    _categories.add(
      CategoryModel(
        backgroundColor: Colors.blue,
        categoryName: "Personal",
        icon: Icons.person,
      ),
    );
    _categories.add(
      CategoryModel(
        backgroundColor: Colors.deepOrange,
        categoryName: "Hospital",
        icon: Icons.local_hospital,
      ),
    );
    _categories.add(
      CategoryModel(
        backgroundColor: Colors.green,
        categoryName: "Study",
        icon: Icons.book,
      ),
    );

    for (CategoryModel category in _categories) {
      _models.add(
        CategoryWithCountModel(
          count: "2",
          category: category,
        ),
      );
      _tasks.add(
        TodoTask(
          category: category,
          name: "Test Work",
          message:
              "I have read many questions about how we can obtain the dimensions or positions of the widgets that we have on screen.In some cases we find ourselves in situations in which we want to achieve that for any reason.",
        ),
      );
    }
  }
}

class MyChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white.withOpacity(.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    Paint paint2 = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.height / 2 - 16.0;

    canvas.drawCircle(
      center,
      radius,
      paint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      pi * 2 * 0.6,
      false,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
