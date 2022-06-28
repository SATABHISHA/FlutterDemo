// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskTile extends StatelessWidget{
  final bool isChecked;
  final String taskTitle;
  final Function chekBoxCallback;
  final VoidCallback longPressCallBack;

  TaskTile({required this.isChecked, required this.taskTitle, required this.chekBoxCallback, required this.longPressCallBack});

  // void checkboxCallback

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: isChecked ? TextStyle(decoration: TextDecoration.lineThrough): null,),
      trailing: Checkbox(
    activeColor:  Colors.lightBlueAccent,
    value: isChecked,
    onChanged: (newValue) {
      chekBoxCallback(newValue);
    },));
  }
}

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

