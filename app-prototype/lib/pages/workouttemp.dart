import 'package:flutter/material.dart';
import 'package:ninja_id_project/services/training.dart';

class WorkoutPage extends StatelessWidget {

  final Training training;

  WorkoutPage({ @required this.training});

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
                training.name,
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
              training.duration,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 100,
              width: 360,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      training.image,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            training.details,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 360,
            child: Text(
              training.description,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          ),
        ],
      ),
    );
  }
}