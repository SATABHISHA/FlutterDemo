// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskTile extends StatelessWidget{
  final bool isChecked = false;

  // void checkboxCallback

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task', style: isChecked ? TextStyle(decoration: TextDecoration.lineThrough): null,),
      trailing: TaskCheckbox(checkboxState: isChecked,toggleCheckboxState: );
  }
}
(bool checkboxState){
setState((){
isChecked = checkboxState;
});
})
class TaskCheckbox extends StatelessWidget {

  late final bool checkboxState;
  Function toggleCheckboxState;
  TaskCheckbox({required this.checkboxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: (bool? value){
        toggleCheckboxState;
      },
    );
  }

}

