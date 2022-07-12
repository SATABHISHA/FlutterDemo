import 'package:flutter/material.dart';

class ListTileSkillSearchResult extends StatelessWidget {
 /* const ListTileSkillSearchResult({
    Key? key,
  }) : super(key: key);*/
  final String skill;
  var count;
  ListTileSkillSearchResult({required this.skill, this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text('$skill', style: TextStyle(color: Colors.black,),
                  ),
                ),
              ),
              decoration: BoxDecoration(

                border: Border.all(color: Color.fromRGBO(190, 190, 190, 1.0), width: 1.0,),
              ),
              height: 35,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text('$count', style: TextStyle(color: Colors.black),
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(202, 108, 30, 1.0)
                // border: Border.all(color: Colors.redAccent, width: 2.0, style: BorderStyle.solid),
              ),
              height: 35,
            ),
          ),
        ],

      ),
    );
  }
}
