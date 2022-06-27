import 'package:flutter/material.dart';
import 'package:todoey/screens/add_task_screen.dart';

class AddTaskScreen extends StatelessWidget {
  // const AddTaskScreen({Key? key}) : super(key: key);

  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);
  @override
  Widget build(BuildContext context) {
    late String newTasktitle;
    return Container(
      color: Color(0xff757575),
      // color: Colors.red,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task', style: TextStyle(fontSize: 30.0, color: Colors.lightBlue),textAlign: TextAlign.center,),
            TextField(autofocus: true, textAlign: TextAlign.center, onChanged: (newText){newTasktitle = newText;},),
            SizedBox(height: 10,),
            FlatButton(onPressed: () {addTaskCallback(newTasktitle);}, child: Text('Add'), color: Colors.lightBlueAccent,),
          ],
        ),
      ),
    );
  }
}
