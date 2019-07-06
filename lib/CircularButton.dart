
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key key,
    @required this.icon,
    @required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
          )
        ],
        shape: BoxShape.circle,
      ),
      width: 48.0,
      height: 48.0,
      child: RawMaterialButton(
        onPressed: onPress ?? () {},
        child: Icon(icon),
        constraints: BoxConstraints.expand(),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}