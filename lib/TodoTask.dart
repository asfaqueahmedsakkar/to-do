import 'package:flutter_to_do_app/CategoryModel.dart';

class TodoTask {
  CategoryModel _category;
  String _name;
  String _message;
  String _time;

  TodoTask({CategoryModel category, String name, String message})
      : _category = category,
        _name = name,
        _message = message,
        _time="7 Jul 2019";

  String get message => _message;

  String get name => _name;

  CategoryModel get category => _category;

  String get time => _time;


}
