import 'package:arb_offc/widgets/admin/reusable_skill_tile_result_list.dart';
import 'package:flutter/material.dart';

class WebScreenAdminSearchScreen1SkillSet extends StatelessWidget {
  const WebScreenAdminSearchScreen1SkillSet({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListTileSkillSearchResult(),
          ),
        ),

        Expanded(
          flex: 4,
          child: SizedBox(
            height: 0,
            // padding: EdgeInsets.symmetric(horizontal: 20.0),
            // color: Colors.white,
            // height: 300,
        ),
          ),
      ],
    );
  }
}