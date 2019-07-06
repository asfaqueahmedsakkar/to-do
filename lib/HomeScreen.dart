import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/AddTaskPage.dart';
import 'package:flutter_to_do_app/CategoryModel.dart';
import 'package:flutter_to_do_app/CategoryWithCountModel.dart';
import 'package:flutter_to_do_app/HomePage.dart';
import 'package:flutter_to_do_app/SignInUpScreen.dart';
import 'package:flutter_to_do_app/TodaysTaskPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 0;
  List<CategoryWithCountModel> models;
  List<CategoryModel> categories;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    models = new List();
    categories = new List();
    _pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    _populateModel();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppTitle(),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: null)
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
        children: <Widget>[
          HomePage(models: models),
          AddTaskPage(categories: categories),
          TodaysTaskPage(),
        ],
      ),
    );
  }

  void _populateModel() {
    models.clear();
    categories.clear();
    categories.add(
      CategoryModel(
        backgroundColor: Colors.orange,
        categoryName: "Work",
        icon: MdiIcons.folderOpenOutline,
      ),
    );
    categories.add(
      CategoryModel(
        backgroundColor: Colors.blue,
        categoryName: "Personal",
        icon: Icons.person,
      ),
    );
    categories.add(
      CategoryModel(
        backgroundColor: Colors.deepOrange,
        categoryName: "Hospital",
        icon: Icons.local_hospital,
      ),
    );
    categories.add(
      CategoryModel(
        backgroundColor: Colors.green,
        categoryName: "Study",
        icon: Icons.book,
      ),
    );

    for (CategoryModel category in categories)
      models.add(
        CategoryWithCountModel(
          count: "2",
          category: category,
        ),
      );
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
