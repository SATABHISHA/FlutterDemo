import 'package:flutter/material.dart';


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