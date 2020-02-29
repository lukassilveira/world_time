import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flagURL: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flagURL: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flagURL: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagURL: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago',flagURL: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flagURL: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flagURL: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flagURL: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      //'flagURL': instance.flagURL,
      //'url': instance.url,
      //'isDayTime': instance.isDaytime,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(locations[index].location),
              onTap: (){
                updateTime(index);
              },
            ),
          );
        },
      ),
    );
  }
}