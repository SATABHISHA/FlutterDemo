import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key? key,}) : super(key: key);
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({required this.colour, required this.cardChild, required this.onPress});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          // color: Color(0xFF1D1E33),
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),

      ),
    );
  }
}