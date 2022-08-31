import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DisplayWeatherData.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  DisplayWeatherData _displayWeatherData = DisplayWeatherData();

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: displayImage(),//Image.asset('images/dayTime.jpg'),
            ),
            //SizedBox(height: 50.0,),
            Container(
              child: _displayWeatherData,
            ),

          ],
        ),
      ),
    );
  }

  //display images baed on current time
  displayImage(){
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);
    if(currentTime.contains('AM')){

      return Image.asset('images/dayTime.jpg');
    }else if(currentTime.contains('PM')){
      return Image.asset('images/nightTime.jpg');
    }
  }

}