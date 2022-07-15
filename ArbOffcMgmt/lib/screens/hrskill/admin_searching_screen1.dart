// import 'dart:ffi';

// import 'dart:ffi';

import 'package:arb_offc/data/admin_constants.dart';
import 'package:arb_offc/data/employee_details.dart';
import 'package:arb_offc/widgets/admin/mobile_screen_admin_search_screen1_skillset.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/admin/mobile_screen_admin_search_screen1.dart';
import '../../widgets/admin/reusable_roundedbutton_search_skill_by_admin.dart';
import '../../widgets/admin/reusable_skill_tile_result_list.dart';
import '../../widgets/admin/sf_circular_pie_char_admin_skill_search.dart';
import '../../widgets/admin/web_screen_admin_search_screen1.dart';
import '../../widgets/admin/web_screen_admin_searching1_skillset.dart';
import 'package:arb_offc/model/employee_skill_details.dart';

final _firestore = FirebaseFirestore.instance;
bool searchSkillTrueFalse = false;
bool searchSkillTotalTrueFalse = false;
var searchTextSplitString;
List<EmployeeSkillDetailsModelClass> employeeSkillDetailsModelClassList = [];
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

  void getEmpData() async{

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('EmpDetails').get();;

    // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //for a specific field
    final allData = querySnapshot.docs.map((doc) => doc.get('MultiSkill')).toList();

    print(allData);
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
    var _textSearchController = TextEditingController();
    /*final children = <Widget>[];
    for (var i = 0; i < 30; i++) {
      children.add(new ListTileSkillSearchResult());
    }*/

     messagesStream();
     getEmpData();
    // getMessageStream();
    // getEmpDetailsTemp();
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
                        controller: _textSearchController,
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
                        searchSkillTotalTrueFalse = true;
                        searchTextSplitString = searchText.split(',');
                        searchTextSplitString.toString().trim();
                        _textSearchController.clear();
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
              // MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1SkillSet(skill: '',count: ,) : WebScreenAdminSearchScreen1SkillSet(),
              searchSkillTotalTrueFalse==true? EmployeesTotalSkillSearch(searchTextResult: searchTextSplitString,): Text(''),
              /* Expanded(
                child: MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1(children: DepartmentDetails(), circularChart: SfCircularPieChartAdminSkillSearch(),) : WebScreenAdminSearchScreen1(children: children, circularChart: SfCircularPieChartAdminSkillSearch()),
              ),*/ //--commented...(it was for testing purpose)


              // DepartmentDetails(),
              searchSkillTrueFalse==true? DepartmentDetails(searchTextResult: searchTextSplitString,): Text(''),

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

class EmployeesTotalSkillSearch extends StatelessWidget {
  // const EmployeesTotalSkillSearch({Key? key}) : super(key: key);
  var searchTextResult;
  EmployeesTotalSkillSearch({required this.searchTextResult});

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

          var skillsEmployee = '';
          var count = 0;
          var loopCount = 0;

        /*  for(int i=0; i<searchTextResult; i++){
            for(int j=i; j<data.length; j++){
              for(int z=0; z<data[j]['MultiSkill']; z++){

              }
            }
          }*/

            /*for (var searchSkill in searchTextResult) {
              for (var skills in data) {
                for(var skillSearch in skills['MultiSkill']){
                  if(searchSkill.toString().trim().toLowerCase() == skillSearch.toString().toLowerCase()){
                    print('skillArrayTesting-=>$skillSearch');
                  }
                }
              }
            }*/


            for (var skills in data) {
              print('MultiSkillTest-=>${skills['MultiSkill'].toString()}');
              for(var skill1 in List.of(skills['MultiSkill'])){
                print('testoi-=>$skill1');
              }
            }


          for (var searchSkill in searchTextResult){
            var skill;
            for(var skills in data){
              // print('MultiSkillTest-=>${skills['MultiSkill'].toString()}');

             /* for(var skill1 in skills['MultiSkill']){
                print('testoi-=>$skill1');
              }*/
             /* for(int i=0; i<skills['MultiSkill']; i++){
                print('testroi-=>${skills[i]['MultiSkill']}');
              }*/
              /*for(int i=0; i<skills['MultiSkill'].length; i++){
                print("MultiSkil-=>${skills[i]['MultiSkill'].toString()}");
              }*/
              // skill = skills['Skill'];
              // for(var skillSearch in skills['MultiSkill']) {
                if (searchSkill.toString().trim().toLowerCase() ==
                    skills['Skill'].toString().toLowerCase()) {
                  count = count + 1;
                  // skill = skills['Skill'];
                  skill = searchSkill;
                }
              // }
            }
            if(loopCount == 0){
              skillsEmployee = skill;
            }else {
              skillsEmployee = skillsEmployee + ', ' + skill;
            }
            loopCount ++;

           /* for(var skills in data){
              // skill = skills['Skill'];
              for(var skillSearch in skills['MultiSkill']){
                if(searchSkill.toString().trim().toLowerCase() == skillSearch.toString().toLowerCase()){
                  print('skillArrayTesting-=>$skillSearch');
                }
              }
              *//*if(searchSkill.toString().trim().toLowerCase() == skills['Skill'].toString().toLowerCase()){
                count = count+1;
                skill = skills['Skill'];
              }*//*
            }*/

          }

          skillsEmployee.replaceFirst(RegExp(','),'',1);

          return MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1SkillSet(skill: skillsEmployee, count: count) : WebScreenAdminSearchScreen1SkillSet(skill: skillsEmployee, count: count);
        }
        return Text('');
      },
      stream: _firestore.collection('EmpDetails').snapshots(),
      // stream: _firestore.collection('EmpDetails').where('Skill', whereIn: ['Mobile', 'Dot Net', 'Designer']).snapshots(),
    );


      // MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1SkillSet(skill: skillsEmployee,count: DepartmentDetails.skillNamesList.length) : WebScreenAdminSearchScreen1SkillSet(skill: skillsEmployee,count: DepartmentDetails.skillNamesList.length);
  }
}


//---Firebase data fetching

class DepartmentDetails extends StatelessWidget {
  // const MessagesStream({Key? key}) : super(key: key);
  // final bool searchBtnClickTrueFalse;
  // DepartmentDetails(this.searchBtnClickTrueFalse);
  static List<String> skillNamesList = <String>[];
  static bool skillSearchTotalTrueFalse = false;
  var searchTextResult;
  DepartmentDetails({required this.searchTextResult});

  @override
  Widget build(BuildContext context) {
    // var datacount = 0;
    var count = 0;
    // searchTextResult = [];
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent,),
          );
        }
        if (snapshot.hasData){
          final data = snapshot.data!.docs;

          for(var searchSkill in data){
            skillNamesList.add(searchSkill['Skill']);
          }
          skillSearchTotalTrueFalse = true;

          List<EmployeeDetails> emp_details_list = [];
          for (var searchSkill in searchTextResult){
            var countSkill = 0;
            print('SkillTestingAgain-=>$searchSkill');
            
            for(var skills in data){
              final skill = skills['Skill'];
              print('skilltesting-=>$skill');
              if(searchSkill.toString().trim().toLowerCase() == skills['Skill'].toString().toLowerCase()){
                countSkill = countSkill+1;
                print('Success ${skills['Skill']}');
              }
            }
            print('DataCount-=>$countSkill');

            emp_details_list.add(new EmployeeDetails(Skill: searchSkill, count: countSkill));
            // count = 0;
            // skillWidgetsList.add(skillWidgets);

            //----testing, starts

            //----testing, ends

          }

          return Expanded(
            child: MediaQuery.of(context).size.width < 760 ? MobileScreenAdminSearchScreen1(children: emp_details_list, circularChart: SfCircularPieChartAdminSkillSearch(),) : WebScreenAdminSearchScreen1(children: emp_details_list, circularChart: SfCircularPieChartAdminSkillSearch()),
          );
        }
        return Text('');
      },
      stream: _firestore.collection('EmpDetails').snapshots(),
      // stream: _firestore.collection('EmpDetails').where('Skill', whereIn: ['Mobile', 'Dot Net', 'Designer']).snapshots(),
    );
  }
}

/*
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
}*/
