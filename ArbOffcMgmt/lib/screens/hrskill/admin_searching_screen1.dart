import 'package:arb_offc/data/admin_constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/admin/mobile_screen_admin_search_screen1.dart';
import '../../widgets/admin/reusable_roundedbutton_search_skill_by_admin.dart';
import '../../widgets/admin/reusable_skill_tile_result_list.dart';
import '../../widgets/admin/sf_circular_pie_char_admin_skill_search.dart';
import '../../widgets/admin/web_screen_admin_search_screen1.dart';

class SearchSkillByAdmin extends StatelessWidget {
  // const SearchSkillByAdmin({Key? key}) : super(key: key);
  static String id = 'SearchSkillByAdmin';

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < 30; i++) {
      children.add(new ListTileSkillSearchResult());
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(92, 76, 121, 1.0), title: Text('Skill Management', style: TextStyle(color: Colors.white, fontSize: 18.0),),),
      body: Stack(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                        textAlign: TextAlign.left,
                        onChanged: (value){},
                        style: TextStyle(color: Colors.black),
                        decoration: kTextFieldDecoration,
                  ),
                      ),
                    ),
                    Expanded(flex:3, child: RoundedButtonSearchSkillByAdminWidget(title: 'Search', onPressed: (){})),
                  ],

                ),
              ),
              // RoundedButtonSearchSkillByAdminWidget(title: 'Search',onPressed: (){},),
              Expanded(
                child: MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1(children: children) : WebScreenAdminSearchScreen1(children: children),
              ),


            ],
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: EdgeInsets.fromLTRB(70, 0, 70, 20),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('Back', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 216 , 216, 1.0),
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            )
          ],
      ),
    );
  }
}





