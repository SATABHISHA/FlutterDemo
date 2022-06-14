import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  colour: Color(0xFF1DE33),
                  cardChild: IconContent(),
              )),
              Expanded(child: ReusableCard(
                colour: Color(0xFF1DE33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.female, size: 80.0,),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Female',style: TextStyle(fontSize: 18.0, color: Color(0xFF8DBE98)),)
                  ],
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
  const IconContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.mars,
          size: 80.0,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Male',
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8DBE98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key? key,}) : super(key: key);
  final Color colour;
  final Widget cardChild;

  ReusableCard({required this.colour, required this.cardChild});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // color: Color(0xFF1D1E33),
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),

    );
  }
}