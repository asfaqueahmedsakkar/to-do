import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/CircularButton.dart';
import 'package:flutter_to_do_app/DateTimeTitleWidget.dart';
import 'package:flutter_to_do_app/TodoTask.dart';

class TodaysTaskPage extends StatelessWidget {
  final List<TodoTask> tasks;

  const TodaysTaskPage({
    Key key,
    this.tasks,
  }) : super(key: key);

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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => TaskRow(
                    task: tasks[index],
                  ),
              itemCount: tasks.length,
            ),
          )
        ],
      ),
    );
  }
}

class TaskRow extends StatefulWidget {
  final TodoTask task;

  const TaskRow({Key key, this.task}) : super(key: key);

  @override
  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  final GlobalKey _key = new GlobalKey();
  double height = 0.0;
  double padding = 6.0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        height = _getHeight() + padding * 2;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 80.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: padding),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      key: _key,
                      constraints: BoxConstraints(minHeight: 60.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(
                            color: widget.task.category.backgroundColor,
                            width: 3.0,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            widget.task.name,
                            style: TextStyle(
                              color: widget.task.category.backgroundColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              widget.task.time,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              widget.task.message,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.radio_button_checked,
                                  size: 12.0,
                                  color: widget.task.category.backgroundColor,
                                ),
                                SizedBox(width: 4.0,),
                                Text(
                                  widget.task.category.categoryName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 80.0,
            height: height,
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.check_box_outline_blank, color: Colors.grey),
                Expanded(
                  child: CustomPaint(
                    painter: DashPainter(Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getHeight() {
    RenderBox _renderBox = _key.currentContext.findRenderObject();
    print(_renderBox.size.height);
    return _renderBox.size.height;
  }
}

class DashPainter extends CustomPainter {
  Color color;

  DashPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = new Paint()
      ..color = color ?? Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    double gap = 4.0;
    double dashHeight = 8.0;

    int counts = (size.height / (gap + dashHeight)).ceil();
    double end = 0.0;
    double start = 0.0;

    for (int i = 0; i < counts; i++) {
      end = start + dashHeight;
      end = end > size.height ? size.height : end;
      Path _path = Path()
        ..moveTo(12.0, start)
        ..lineTo(12.0, end);

      start = end + gap;
      canvas.drawPath(_path, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
