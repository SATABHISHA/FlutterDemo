import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  // const AddTaskScreen({Key? key}) : super(key: key);

  // final Function addTaskCallback;
  // AddTaskScreen(this.addTaskCallback);
  String newTaskTitle = "";
  @override
  Widget build(BuildContext context) {
    // late String newTasktitle;

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
            TextField(autofocus: true, textAlign: TextAlign.center, onChanged: (newText){newTaskTitle = newText;},),
            SizedBox(height: 10,),
            FlatButton(
              onPressed: () {
                // final task = Task(name: newTaskTitle);
                print(newTaskTitle);
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
                },
              child: Text('Add'),
              color: Colors.lightBlueAccent,),
          ],
        ),
      ),
    );
  }
}
