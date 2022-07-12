

import 'package:flutter/material.dart';

import '../widgets/admin/reusable_skill_tile_result_list.dart';

class EmployeeDetails extends StatelessWidget{
  final String Skill;
  var count ;
  EmployeeDetails({required this.Skill, required this.count});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('Skill-=>$Skill and count-=>$count');
    return ListTileSkillSearchResult(skill: Skill, count: count);
  }


  /*String get Skill => _Skill;


  get count => _count;

  set Skill(String value) {
    _Skill = value;
  }

  set count(value) {
    _count = value;
  }*/


}