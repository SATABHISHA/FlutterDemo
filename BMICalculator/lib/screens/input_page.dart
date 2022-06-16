import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


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
  int age = 20;

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
              Expanded(child: ReusableCard(
                onPress: (){

                },
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age',style: kLabelTextStyle,),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.add,
                          onPressed: (){
                            setState((){
                               age++;
                            });

                          },),
                        SizedBox(width: 10,),
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState((){
                              age--;
                            });

                          },),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          )),
          BottomButton(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },
            buttonTitle: 'Calculate',
          ) ,
        ],
      )

    );
  }
}









