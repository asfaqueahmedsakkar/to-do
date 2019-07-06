import 'package:flutter/material.dart';

class DateTimeTitleWidget extends StatelessWidget {
  final DateTime date;
  final TextStyle style;

  const DateTimeTitleWidget({
    Key key,
    @required this.date,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_getDateTitle(date)}",
      style: style ??
          TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  _getDateTitle(DateTime selectedDate) {
    String date = "Today";
    DateTime today = DateTime.now();
    DateTime tomorrow = today.add(Duration(days: 1));
    if (selectedDate.year == today.year &&
        selectedDate.month == today.month &&
        selectedDate.day == today.day) {
      date = "Today";
    } else if (selectedDate.year == tomorrow.year &&
        selectedDate.month == tomorrow.month &&
        selectedDate.day == tomorrow.day) {
      date = "Tomorrow";
    } else {
      date =
          "${selectedDate.day} ${_getMonth(selectedDate.month)} ${selectedDate.year}";
    }
    return date;
  }

  _getMonth(int m) {
    switch (m) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
    }
  }
}
