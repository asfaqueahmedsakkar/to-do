import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/date_picker.dart';
import 'package:flutter_to_do_app/CategoryModel.dart';
import 'package:flutter_to_do_app/DateTimeTitleWidget.dart';
import 'package:flutter_to_do_app/FullButton.dart';

class AddTaskPage extends StatefulWidget {
  final List<CategoryModel> categories;

  const AddTaskPage({Key key, this.categories}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime selectedDate;
  int categoryIndex = -1;

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = _getItems();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: items,
      ),
    );
  }

  Widget _dateInput(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getSubTitle("Choose Date"),
        GestureDetector(
            onTap: () => DatePicker.showDatePicker(
                  context,
                  initialDateTime: selectedDate,
                  onConfirm: (date, list) {
                    setState(() {
                      selectedDate = DateTime.utc(
                        date.year,
                        date.month,
                        date.day,
                        selectedDate.hour,
                        selectedDate.minute,
                        selectedDate.second,
                      );
                    });
                  },
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  DateTimeTitleWidget(date: selectedDate),
                  SizedBox(
                    width: 16.0,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 24.0,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _timeInput(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getSubTitle("Choose Time"),
        GestureDetector(
            onTap: () => DatePicker.showDatePicker(
                  context,
                  pickerMode: DateTimePickerMode.time,
                  initialDateTime: selectedDate,
                  onConfirm: (date, list) {
                    setState(() {
                      selectedDate = DateTime.utc(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        date.hour,
                        date.minute,
                        date.second,
                      );
                    });
                  },
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "${_getTime()}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 24.0,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Text _getSubTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  _getTime() {
    return "${selectedDate.hour % 12 == 0 ? 12 : selectedDate.hour % 12}: ${selectedDate.minute.toString().padLeft(2, "0")}: ${selectedDate.second.toString().padLeft(2, "0")} ${selectedDate.hour ~/ 12 == 0 ? "AM" : "PM"}";
  }

  List<Widget> _getItems() {
    List<Widget> list = new List();
    list.add(SizedBox(
      height: 16.0,
    ));
    list.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "New Task",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ));
    list.add(Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Color(0xFF4ce5ae),
              width: 2.0,
            ),
          ),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Name Your Task",
            hintStyle: TextStyle(
                color: Colors.black26,
                fontSize: 16.0,
                fontWeight: FontWeight.w300),
          ),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
      ),
    ));
    list.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: _dateInput(context),
    ));
    list.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: _timeInput(context),
    ));

    list.add(_getSubTitle("Categories"));
    for (int i = 0; i < widget.categories.length; i++)
      list.add(
        _getCategoryButton(
          category: widget.categories[i],
          index: i,
        ),
      );

    list.add(SizedBox(
      height: 16.0,
    ));

    list.add(_getSubTitle("Write short description"));

    list.add(TextField(
      decoration: InputDecoration(
          hintText: "Message",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.black26,
          )),
    ));

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: FullButton(
          title: "Done",
          fontStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          color: Colors.green,
          onPress: () {},
        ),
      ),
    );

    return list;
  }

  _getCategoryButton({
    @required CategoryModel category,
    @required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categoryIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Icon(
              index == categoryIndex
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: category.backgroundColor,
            ),
            Text(category.categoryName),
          ],
        ),
      ),
    );
  }
}
