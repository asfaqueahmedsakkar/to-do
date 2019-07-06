
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/CategoryModel.dart';

class CategoryWithCountModel {
  CategoryModel category;
  String count;

  CategoryWithCountModel({
    @required this.count,
    @required this.category,
  });
}