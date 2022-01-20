import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtomSheet extends StatefulWidget {
    final Function title;
   ButtomSheet( this.title);
  @override
  _ButtomSheetState createState() => _ButtomSheetState();
}

class _ButtomSheetState extends State<ButtomSheet> {
   String newtask='';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50.0,right: 40.0,left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Task',textAlign:TextAlign.center,style: TextStyle(fontSize: 30.0,color: Colors.lightBlueAccent),),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value){
                  newtask=value;
                },
              ),
              SizedBox(height: 20.0),
              FlatButton(
                color: Colors.lightBlue,
                onPressed: (){
                  widget.title(newtask);
                  Navigator.pop(context);
                },
                  child: Text('ADD',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
