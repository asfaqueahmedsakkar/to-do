import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/SignInUpScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 0;
  List<CategoryWithCountModel> models;

  @override
  void initState() {
    super.initState();

    models = new List();
    models.add(
      CategoryWithCountModel(
        backgroundColor: Colors.orange,
        categoryName: "Work",
        count: "7",
        icon: MdiIcons.folderOpenOutline,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text("Today's Task"),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 220.0,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green[300],
                        blurRadius: 8.0,
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Weekly",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CustomPaint(
                                  painter: MyChartPainter(),
                                  child: Center(
                                    child: Text(
                                      "60%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(8.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            _buildDetails(),
                            Container(
                              height: 24,
                              width: 1.0,
                              color: Colors.white,
                            ),
                            _buildDetails(),
                            Container(
                              height: 24,
                              width: 0.5,
                              color: Colors.white,
                            ),
                            _buildDetails(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return new CategoryWithCount(
                  model: models[index],
                );
              },
              childCount: models.length,
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildDetails({String title = "Line", String amount = "24"}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWithCountModel {
  Color backgroundColor;
  String categoryName;
  String count;
  IconData icon;

  CategoryWithCountModel({
    @required this.backgroundColor,
    @required this.categoryName,
    @required this.count,
    @required this.icon,
  });
}

class CategoryWithCount extends StatelessWidget {
  final CategoryWithCountModel model;

  const CategoryWithCount({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: model.backgroundColor.withOpacity(0.8),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                color: model.backgroundColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  MdiIcons.heartPulse,
                  size: 90.0,
                  color: Colors.white24,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  model.categoryName,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  model.count,
                  style: TextStyle(
                    fontSize: 32.0,
                    color: model.backgroundColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            )
          ],
        ),
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
