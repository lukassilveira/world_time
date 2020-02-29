import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> list = [
    WorldTime(url: 'Europe/London', location: 'London', flagURL: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flagURL: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flagURL: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagURL: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flagURL: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flagURL: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flagURL: 'south korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flagURL: 'indonesia.png'),
    //WorldTime(url: 'Europe/Berlin', location: 'Berlin', flagURL: 'germany.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = list[index];
    await instance.getTime();

    Navigator.pushNamed(context, '/home', arguments:{
      'location': instance.location,
      'flagURL': instance.flagURL,
      'url': instance.url,
      'time': instance.time,
      'isDayTime': instance.isDaytime,
    });
  }

  void updateTimer(index) async {
    WorldTime instance = list[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
      'flagURL': instance.flagURL,
      'url': instance.url,
    });
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Location'),
      ),
    );
  }
}