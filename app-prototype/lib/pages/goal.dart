import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Workout'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 350,
            child: Center(
              child: Text(
                "Goal:",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 3.0,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Marathon",
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 3.0,
                fontSize: 20.0,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 40,
            endIndent: 40,
            height: 50.0,
            color: Colors.black,
          ),         
        ],
      ),
    );
  }
}