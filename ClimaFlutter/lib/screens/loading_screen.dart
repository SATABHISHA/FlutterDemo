import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // getLocation();
  }


  @override
  void deactivate() {

  }
void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

}

void getData() async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=4e9ab4284c157b02b2e4ec253edde350'));
    print(response.body);

    if (response.statusCode == 200){
      String data = response.body;
      print(data);
      var longitude = jsonDecode(data)['coord']['lon'];
      print(longitude);

      var decodedData = jsonDecode(data);
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      var weatherDescription = decodedData['weather'][0]['description'];
    }else{
      print(response.statusCode);
    }
}

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      /*body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location

            // getLocation();
          },
          child: Text('Get Location'),
        ),
      ),*/
    );
  }


}
