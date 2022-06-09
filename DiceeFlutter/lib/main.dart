import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  var leftDiceNumber = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
             flex: 1,
              child: FlatButton(
                onPressed: () {
                  print('Left button pressed');
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(

                onPressed: () {
                  print('Right button pressed');
                },
                child: Image(
                  image: AssetImage('images/dice1.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
