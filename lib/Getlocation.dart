import 'package:geolocator/geolocator.dart';

class Getlocation{
  //Get current location
  Future getCurrentLocation() async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      return position;
    }catch(e){
      print(e);
    }
  }
}