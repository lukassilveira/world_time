import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flagURL;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flagURL, this.url});

  Future<void> getTime() async {

    try {
    //make request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data['week_number']);

    //get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // create DateTime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    
    //set time property
    time = DateFormat.jm().format(now);
    isDaytime = (now.hour > 5 && now.hour < 19) ? true : false;
    } 
    
    catch (e) {
      print('erroer: $e');
      time = 'Error retrieving data';
    }
  }
}