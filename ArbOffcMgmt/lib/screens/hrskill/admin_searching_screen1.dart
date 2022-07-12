import 'package:arb_offc/data/admin_constants.dart';
import 'package:arb_offc/widgets/admin/mobile_screen_admin_search_screen1_skillset.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/admin/mobile_screen_admin_search_screen1.dart';
import '../../widgets/admin/reusable_roundedbutton_search_skill_by_admin.dart';
import '../../widgets/admin/reusable_skill_tile_result_list.dart';
import '../../widgets/admin/sf_circular_pie_char_admin_skill_search.dart';
import '../../widgets/admin/web_screen_admin_search_screen1.dart';
import '../../widgets/admin/web_screen_admin_searching1_skillset.dart';

final _firestore = FirebaseFirestore.instance;
bool searchSkillTrueFalse = false;
class SearchSkillByAdmin extends StatefulWidget {
  // const SearchSkillByAdmin({Key? key}) : super(key: key);
  static String id = 'SearchSkillByAdmin';

  @override
  State<SearchSkillByAdmin> createState() => _SearchSkillByAdminState();
}

class _SearchSkillByAdminState extends State<SearchSkillByAdmin> {
  void messagesStream() async {
    await for( var snapshot in _firestore.collection('EmpDetails').snapshots()){
      for (var message in snapshot.docs){
        print(message.data());
      }
    }
  }

   void  getMessageStream() {
     StreamBuilder(
         stream: _firestore.collection('EmpDetails').snapshots(),
         builder: (context, snapshot) {
           print('Hello testing');
           if (!snapshot.hasData) {
             return new Text("Loading");
           }
           var userDocument = snapshot.data;
           print(userDocument);
           return new Text('Success');
           // return new Text(userDocument["name"]);
         }
     );
  }

  @override
  Widget build(BuildContext context) {
    String searchText = '';
    var searchTextSplitString;
    /*final children = <Widget>[];
    for (var i = 0; i < 30; i++) {
      children.add(new ListTileSkillSearchResult());
    }*/

     messagesStream();
    // getMessageStream();
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(92, 76, 121, 1.0), title: Text('Skill Management', style: TextStyle(color: Colors.white, fontSize: 18.0),),),
      body: Stack(
          children: [
            // GetUserName(documentId: '1q6508s5mW34FJodP01E'),
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
                        onChanged: (value){
                          searchText = value;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: kTextFieldDecoration,
                  ),
                      ),
                    ),
                    Expanded(flex:3, child: RoundedButtonSearchSkillByAdminWidget(title: 'Search', onPressed: (){
                      setState((){
                        searchSkillTrueFalse = true;
                        searchTextSplitString = searchText.split(',');
                        print('values-=>$searchTextSplitString');
                      });

                    })),
                  ],

                ),
              ),
              // RoundedButtonSearchSkillByAdminWidget(title: 'Search',onPressed: (){},),

              SizedBox(height: 10,),
              MediaQuery.of(context).size.width < 760 ? Center(child: Text('Search Result', style: TextStyle(fontSize: 18, color: Colors.black),)) : Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Search Result', style: TextStyle(fontSize: 18, color: Colors.black),),
              ),
              MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1SkillSet() : WebScreenAdminSearchScreen1SkillSet(),

             /* Expanded(
                child: MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1(children: DepartmentDetails(), circularChart: SfCircularPieChartAdminSkillSearch(),) : WebScreenAdminSearchScreen1(children: children, circularChart: SfCircularPieChartAdminSkillSearch()),
              ),*/ //--commented...(it was for testing purpose)


              // DepartmentDetails(),
              searchSkillTrueFalse==true? DepartmentDetails(): Text(''),

              Container(
                margin: EdgeInsets.fromLTRB(70, 0, 70, 20),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text('Back', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 216 , 216, 1.0),
                    borderRadius: BorderRadius.circular(5)
                ),
              )
            ],
            ),
            /*Align(
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
            )*/
          ],
      ),
    );
  }
}

//---Firebase data fetching

class DepartmentDetails extends StatelessWidget {
  // const MessagesStream({Key? key}) : super(key: key);
  // final bool searchBtnClickTrueFalse;
  // DepartmentDetails(this.searchBtnClickTrueFalse);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent,),
          );
        }
        if (snapshot.hasData){
          final data = snapshot.data!.docs;
          final
          List<ListTileSkillSearchResult> skillWidgetsList = [];
          for (var skills in data){
            final skill = skills['Skill'];

            // final currentUser = loggedInUser.email;


            final skillWidgets = ListTileSkillSearchResult(skill: skill,);
            skillWidgetsList.add(skillWidgets);
          }
          return Expanded(
            child: MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1(children: skillWidgetsList, circularChart: SfCircularPieChartAdminSkillSearch(),) : WebScreenAdminSearchScreen1(children: skillWidgetsList, circularChart: SfCircularPieChartAdminSkillSearch()),
          );
        }
        return Text('No data');
      },
      stream: _firestore.collection('EmpDetails').snapshots(),
    );
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('EmpDetails');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
          print("Name: ${data['Name']}");
          return Text("Name: ${data['Name']}");
        }

        return Text("loading");
      },
    );
  }
}