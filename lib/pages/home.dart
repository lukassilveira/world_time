import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    Color bgColor = data['isDayTime'] ? Colors.white : Colors.grey[900];
    Color fontColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),  
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 0 , 20),
                child: Text(
                  data['location'],
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 40,
                    letterSpacing: 3,
                  ),
                ),
              ),
              Text(
                data['time'],
                style: TextStyle(
                  color: fontColor,
                  letterSpacing: 2,
                  fontSize: 60,
                ),
              ),
              SizedBox(height: 40,),
              FlatButton.icon(
                color: Colors.grey[400],
                onPressed: () {   
                  Navigator.pushNamed(context, '/location');             
                },
                icon: Icon(
                  Icons.edit_location,
                  color: fontColor,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}