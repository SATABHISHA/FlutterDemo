import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200){
      String data = response.body;
      print(data);
      var longitude = jsonDecode(data)['coord']['lon'];
      print(longitude);

      var decodedData = jsonDecode(data);
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      var weatherDescription = decodedData['weather'][0]['description'];

      return jsonDecode(data);
    }else{
      print(response.statusCode);
    }
  }

}