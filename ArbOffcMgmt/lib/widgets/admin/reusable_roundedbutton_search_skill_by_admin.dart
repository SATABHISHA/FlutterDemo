import 'package:flutter/material.dart';

class RoundedButtonSearchSkillByAdminWidget extends StatelessWidget {
  /*const RoundedButtonAdminSkillWidget({
    Key? key,
  }) : super(key: key);*/
  final String title;
  final VoidCallback onPressed;
  RoundedButtonSearchSkillByAdminWidget({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Material(
        elevation: 5.0,
        color: Color.fromRGBO(92, 76, 121, 1.0),
        borderRadius: BorderRadius.circular(5),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: 80,
            height: 50,
            child: Stack(
              children: [
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