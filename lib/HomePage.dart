

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/CategoryWithCountModel.dart';
import 'package:flutter_to_do_app/CategoryWithCountWidget.dart';
import 'package:flutter_to_do_app/HomeScreen.dart';

class HomePage extends StatelessWidget {
  final List<CategoryWithCountModel> models;

  HomePage({this.models});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                        borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8.0)),
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
              return new CategoryWithCountWidget(
                model: models[index],
              );
            },
            childCount: models.length,
          ),
        )
      ],
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