import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/CircularButton.dart';
import 'package:flutter_to_do_app/DateTimeTitleWidget.dart';

class TodaysTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new CircularButton(
                  onPress: () {},
                  icon: Icons.arrow_back_ios,
                ),
                DateTimeTitleWidget(
                  date: DateTime.now(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                new CircularButton(
                  onPress: () {},
                  icon: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
