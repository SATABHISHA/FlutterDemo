import 'package:flutter/material.dart';

class RoundedButtonAdminSkillWidget extends StatelessWidget {
  /*const RoundedButtonAdminSkillWidget({
    Key? key,
  }) : super(key: key);*/
  final String title;
  final VoidCallback onPressed;
  RoundedButtonAdminSkillWidget({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Material(
        elevation: 5.0,
        color: Color.fromRGBO(92, 76, 121, 1.0),
        borderRadius: BorderRadius.circular(5),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200,
            height: 50,
            child: Stack(
              children: [
                Icon(Icons.add, size: 20,),
                Align(
                  alignment: FractionalOffset.center,
                  child: Text(
                      '$title',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16)),
                ),
              ],
            )),

      ),
    );
  }
}