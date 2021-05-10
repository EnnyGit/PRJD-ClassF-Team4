import 'package:flutter/material.dart';

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0EBEE),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Workout'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Center(
            child: Text(
              'Runners Workout',
              style: TextStyle(
                color: Colors.blue[800],
                letterSpacing: 3.0,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            )
          )
        ],
      ),
    );
  }
}