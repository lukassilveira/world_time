import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart'; 
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flagURL: 'germany.jpg', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      //'flagURL': instance.flagURL,
      //'url': instance.url,
      'time': instance.time,
      //'isDayTime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 150,
        )
      ),
    );
  }
}