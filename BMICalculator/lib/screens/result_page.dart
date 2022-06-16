import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'input_page.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage({Key? key}) : super(key: key);

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
                    Text(
                        'Normal',
                    style: kResultTextStyle,),
                    Text(
                        '18.3',
                      style: kBMITextStyle,
                    ),
                    Text('Your BMI result', style: kBodyTextStyle, textAlign: TextAlign.center,)
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
