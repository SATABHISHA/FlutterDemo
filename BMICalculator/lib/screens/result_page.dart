import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'input_page.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage({Key? key}) : super(key: key);
  ResultPage({required this.interpretation, required this.bmiResult, required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleTextStyle,),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                onPress: (){

                },
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: kResultTextStyle,),
                    Text(bmiResult, style: kBMITextStyle,),
                    Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,)
                  ],
                ),
              )),
          BottomButton(
              onTap: (){

                Navigator.pop(context);
              },
              buttonTitle: 'ReCalculate')
        ],
      ),
    );
  }
}
