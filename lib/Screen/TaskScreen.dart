import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListTitle.dart';
import 'ButtomShett.dart';
import 'Task.dart';
import 'update.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  int count=0;
  List<Task> tasks=[];
  Update update=Update();

  @override
  void initState() {
    super.initState();
    // update.display(tasks);
    // count=tasks.length;
    display();
  }

  void display() async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    List<String>? u=pref.getStringList('key');
    List<String>? w=pref.getStringList('value');
    for(int i=0;i<u!.length;i++){
      String x=u[i];
      String y=w![i];
      bool m;
      if(y=='true'){
        m=true;
      }
      else{
        m=false;
      }
      tasks.add(Task(name: x,checked: m));
    }
    setState(() {
      count=tasks.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context)=> ButtomSheet((newtask){
            setState(() {
              tasks.add(Task(name: newtask));
              count=tasks.length;
              update.retain(tasks);
            });
          }));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text('Todoey',style: TextStyle(color: Colors.white,fontSize: 50.0,fontWeight:FontWeight.w700 ),),
                  Text('$count Tasks',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),),
                  color: Colors.white,
                ),
                child: ListView.builder(
                    itemBuilder: (context,counter){
                      return ListTitle(name: tasks[counter].name, checked: tasks[counter].checked,counter: counter,take: tasks,);
                    },
                  itemCount: tasks.length,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0,left: 10.0,right: 250.0),
              child: CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                  radius: 28.0,
                  child: FlatButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context){
                        return Padding(
                          padding: EdgeInsets.only(left: 30.0,top: 250,bottom: 300,right: 30),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10,top: 30,bottom: 5,right: 10),
                              child: Column(
                                children: [
                                  Text('Are you sure want to delete all the task?',style: TextStyle(fontSize: 15,color: Colors.black),),
                                  SizedBox(height: 50),
                                  Row(
                                    children: [
                                      FlatButton(
                                          onPressed: () { Navigator.pop(context); },
                                          color: Colors.lightBlueAccent,
                                       child: Text('Cancel',style: TextStyle(fontSize: 20,color: Colors.black),)),
                                      SizedBox(width: 40,),
                                      FlatButton(onPressed: () async{
                                        setState(() {
                                          count=0;
                                          tasks=[];
                                          update.delete();
                                          Navigator.pop(context);
                                        });
                                      },
                                          color: Colors.lightBlueAccent,
                                      child: Text('Confirm',style: TextStyle(fontSize: 20,color: Colors.black),)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                      child: Icon(Icons.delete,size: 30,color: Colors.white,),
                  ),
              ),
              decoration:BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
        )
      ),
    );
  }
}
