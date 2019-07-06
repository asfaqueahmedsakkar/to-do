
import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  const FullButton(
      {Key key,
        @required this.onPress,
        @required this.title,
        @required this.color,
        this.fontStyle})
      : super(key: key);

  final Function() onPress;
  final String title;
  final Color color;
  final TextStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      alignment: Alignment.center,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        fillColor: color,
        onPressed: onPress,
        constraints: BoxConstraints.expand(),
        child: Text(
          title,
          style: fontStyle ??
              TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14.0,
              ),
        ),
      ),
    );
  }
}