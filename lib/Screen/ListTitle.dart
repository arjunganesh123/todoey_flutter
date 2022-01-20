import 'package:flutter/material.dart';
import 'package:todoey_flutter/Screen/Task.dart';
import 'package:todoey_flutter/Screen/TaskScreen.dart';
import 'update.dart';

class ListTitle extends StatefulWidget {
  final String name;
  final bool checked;
  final int counter;
  List<Task> take;

  ListTitle({required this.name,required this.checked,required this.counter,required this.take});

  @override
  _ListTitleState createState() => _ListTitleState();
}

class _ListTitleState extends State<ListTitle> {
  Update updatee=Update();
  TaskScreen taskScreen=TaskScreen();
  late final String names;
  bool pressedvalue=false;
  @override
  void initState() {
    names=widget.name;
    pressedvalue=widget.checked;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$names',style: TextStyle(decoration:pressedvalue ? TextDecoration.lineThrough:null),),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: pressedvalue,
        onChanged: (bool ? press) {
          setState(() {
            pressedvalue=press!;
            widget.take[widget.counter].checked=pressedvalue;
            updatee.retain(widget.take);
          });
        },
      ),
    );
  }
}


