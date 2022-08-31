import 'WeatherData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Getlocation.dart';

class HttpHandler{
  static const String _apiKey = 'ea429197b38be89cb9a58407faa003b0';
  static Getlocation _getLocation = Getlocation();

  //Get current temp
  static Future<WeatherData> getTemp() async{

    var _getLatLon = await _getLocation.getCurrentLocation();

    if(_getLatLon != null){
      http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=${_getLatLon.latitude}&lon=${_getLatLon.longitude}&appid=$_apiKey&units=metric');
      if(response.statusCode == 200){
        return WeatherData.fromJSON(json.decode(response.body));
      }else{
        throw Exception('Failed to fitch weather data');
      }
    }
  }

}