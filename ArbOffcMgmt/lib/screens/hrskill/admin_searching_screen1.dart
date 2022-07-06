import 'package:arb_offc/data/admin_constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/admin/reusable_roundedbutton_search_skill_by_admin.dart';

class SearchSkillByAdmin extends StatelessWidget {
  // const SearchSkillByAdmin({Key? key}) : super(key: key);
  static String id = 'SearchSkillByAdmin';

  @override
  Widget build(BuildContext context) {
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
                  child: ListView(
                    reverse: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

                    children: [
                      Row(
                        children: [
                          Container(

                              child: Text('data', style: TextStyle(color: Colors.black),
                              ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.redAccent, width: 2.0, style: BorderStyle.solid),
                            ),
                            width: 200,
                            height: 50,
                          )
                        ],
                      )

                    ],
                  ),
                )
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
