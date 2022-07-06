import 'package:flutter/material.dart';

class ListTileSkillSearchResult extends StatelessWidget {
  const ListTileSkillSearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text('Skill', style: TextStyle(color: Colors.black,),
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
                child: Text('25', style: TextStyle(color: Colors.black),
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
