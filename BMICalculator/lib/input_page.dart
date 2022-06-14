import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';

const bottomContainerHeight = 80.0;
const inactiveCardColor = Color(0xF111328);
const activeCardColor = Color(0xFF1D1E33);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female,
  NA
}
class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.NA;
  /*Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;*/

  //1=male, 2=female
 /* void updateColor(Gender selectGender){
    if(selectGender == Gender.male){
      if(maleCardColor == inactiveCardColor){
        maleCardColor = activeCardColor;
      }else{
        maleCardColor = inactiveCardColor;
      }
    }
    if(selectGender == Gender.female){
      if(femaleCardColor == inactiveCardColor){
        femaleCardColor = activeCardColor;
      }else{
        femaleCardColor = inactiveCardColor;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                  // colour: Color(0xFF1DE33),
                  // colour: maleCardColor,
                 onPress: (){
                   setState((){
                     selectedGender = Gender.male;
                   });
                   // selectedGender = Gender.male;
                 },
                  colour: selectedGender == Gender.male? activeCardColor: inactiveCardColor,
                  cardChild: IconContent(
                    customIcon: Icon(FontAwesomeIcons.male, size: 80.0,),
                      customText: 'Male'
                  ),
              )),
              Expanded(child: ReusableCard(
                // colour: Color(0xFF1DE33),
                // colour: femaleCardColor,
                onPress: () {
                  setState((){
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female? activeCardColor: inactiveCardColor,
                cardChild: IconContent(customIcon: Icon(FontAwesomeIcons.female, size: 80), customText: 'Female'),
              ))
            ],

          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ))
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 200.0,
                width: 170.0,
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 200.0,
                width: 170.0,
              ))
            ],
          )),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ) ,
        ],
      )

    );
  }
}

class IconContent extends StatelessWidget {
  // const IconContent({Key? key,}) : super(key: key);
  final Icon customIcon;
  final String customText;
  IconContent({required this.customIcon, required this.customText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customIcon,
        /*Icon(
          FontAwesomeIcons.mars,
          size: 80.0,
        ),*/
        SizedBox(
          height: 20,
        ),
        Text(
          customText,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8DBE98)),
        )
      ],
    );
  }
}

