import 'package:shared_preferences/shared_preferences.dart';
import 'Task.dart';

class Update{
  List<String> copytext=[];
  List<String> booll=[];

  void retain(List<Task> tasks) async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    copytext=[];
    booll=[];
    for(int i=0;i<tasks.length;i++){
      String x=tasks[i].name;
      copytext.add(x);
      String y=tasks[i].checked.toString();
      booll.add(y);
    }
    pref.setStringList('key', copytext);
    pref.setStringList('value', booll);
  }

  // void display(List<Task> tasks) async{
  //   SharedPreferences pref= await SharedPreferences.getInstance();
  //   List<String>? u=pref.getStringList('key');
  //   List<String>? w=pref.getStringList('value');
  //   for(int i=0;i<u!.length;i++){
  //     String x=u[i];
  //     String y=w![i];
  //     bool m;
  //     if(y=='true'){
  //       m=true;
  //     }
  //     else{
  //       m=false;
  //     }
  //     tasks.add(Task(name: x,checked: m));
  //   }
  // }

  void delete() async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    copytext=[];
    booll=[];
    pref.clear();
  }

}