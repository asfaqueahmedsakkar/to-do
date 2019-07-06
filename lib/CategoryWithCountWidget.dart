

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/CategoryModel.dart';
import 'package:flutter_to_do_app/CategoryWithCountModel.dart';
import 'package:flutter_to_do_app/HomeScreen.dart';

class CategoryWithCountWidget extends StatelessWidget {
  final CategoryWithCountModel model;

  const CategoryWithCountWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryModel category = model.category;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: category.backgroundColor.withOpacity(0.6),
                blurRadius: 4.0,
              ),
            ],
            border: Border.all(color: category.backgroundColor, width: 0.5)),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: category.backgroundColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  category.icon,
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
                  category.categoryName,
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
                    color: category.backgroundColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
            RawMaterialButton(
              constraints: BoxConstraints.expand(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}