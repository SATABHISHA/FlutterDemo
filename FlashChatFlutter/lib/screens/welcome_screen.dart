import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller ;
  Animation animation;


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 10));
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();

    // controller.reverse(from: 1.0);
    animation.addStatusListener((status) {
      print(status);
      /*if (status == AnimationStatus.completed){
        controller.reverse(from: 1.0);
      }else if (status == AnimationStatus.dismissed){
        controller.forward();
      }*/
    });
    controller.addListener(() {
      setState(() {
      });
      print(controller.value);
    });
  }

  double checkWidthPlatform(){

      /*if (kIsWeb){
        return 50.0;
      }else{
        return 200.0;
      }*/
    if (Platform.isAndroid) {
      return 200.0;
    }
      else{
        return 50.0;
       }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors.red.withOpacity(controller.value),
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    // height: animation.value*100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  // '${controller.value.toInt()}%',
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Login', colour: Colors.lightBlueAccent, onPressed: (){Navigator.pushNamed(context, LoginScreen.id);},),
            RoundedButton(title: 'Register', colour: Colors.blueAccent, onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);},),
          ],
        ),
      ),
    );
  }
}


