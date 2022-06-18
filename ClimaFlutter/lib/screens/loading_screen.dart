import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    // getLocationData();
    checkLocationPermissionAndFetchLocation();
  }


  @override
  void deactivate() {

  }
void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
}

  Future<void> checkLocationPermissionAndFetchLocation() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
     if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
        // return false;
      } if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error('Location permissions are permanently denied, we cannot request permissions.');
        // return false;
      }
    }
    getLocationData();
  }
  @override
  Widget build(BuildContext context) {
    // getData();
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
