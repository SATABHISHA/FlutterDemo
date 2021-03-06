import 'package:arb_offc/widgets/admin/reusable_skill_tile_result_list.dart';
import 'package:flutter/material.dart';

class MobileScreenAdminSearchScreen1SkillSet extends StatelessWidget {
  var count;
  String skill;
  MobileScreenAdminSearchScreen1SkillSet({required this.skill, required this.count});
  /*const MobileScreenAdminSearchScreen1SkillSet({
    Key? key,

  }) : super(key: key);*/


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListTileSkillSearchResult(skill: skill, count: count),
    );
  }
}