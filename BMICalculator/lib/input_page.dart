import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';


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
  int height = 180;
  int weight = 80;
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
        resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  colour: selectedGender == Gender.male? kActiveCardColor: kInactiveCardColor,
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
                colour: selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
                cardChild: IconContent(customIcon: Icon(FontAwesomeIcons.female, size: 80), customText: 'Female'),
              ))
            ],

          )),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){

                },
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',
                    style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                         value: height.toDouble(),
                          min: 120.0,
                          max: 220,
                          // activeColor: Color(0xFFEB1555),
                          // activeColor: Colors.white,
                          // inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue){
                           setState((){
                             height = newValue.round();
                           });

    },),
                    ),
                  ],
                ),
              ),)
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){

                },
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.add,
                        onPressed: (){
                          setState((){
                            weight++;
                          });

                        },),
                        SizedBox(width: 10,),
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState((){
                            weight--;
                          });

                        },),
                      ],
                    ),
                  ],
                ),
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
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ) ,
        ],
      )

    );
  }
}

class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({Key? key}) : super(key: key);
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
       constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




