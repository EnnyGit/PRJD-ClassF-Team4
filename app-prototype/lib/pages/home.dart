import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  int fitnessLevel = 0;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFE0EBEE),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/user2.jpg'),
                  radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.blue[800],
            ),
            Center(
              child: Text(
                '${data['displayName']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Center(
              child: Text(
                'Schiedam, Netherlands',
                style: TextStyle(
                  color: Colors.blue[800],
                  letterSpacing: 2.0,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
            SizedBox(height: 60.0),
            Row(children: <Widget>[
              SizedBox(width: 10.0),
              Text(
                'Level: ${data['level'].toStringAsFixed(0)}',
                style: TextStyle(
                  color: Colors.blue[800],
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                  ),
                ),
              SizedBox(width: 90.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Endurance: ${data['endurance'].toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.lightGreen[900],
                      letterSpacing: 2.0,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Sleep: ${data['sleep']}',
                    style: TextStyle(
                      color: Colors.purple[600],
                      letterSpacing: 2.0,
                      fontSize: 18,  
                    )                 
                  ),
                  Text(
                    'Speed: ${data['speed'].toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.amber[800],
                      letterSpacing: 2.0,
                      fontSize: 18, 
                    )                   
                  ),
                  ],
                ),
              ]
            ),          
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.fitness_center,
                    color: Colors.grey[500],
                    size: 40
                  ),
                  label: Text('Training'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 53, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose_training');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40
                  ),
                  label: Text('Goals'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/goal');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.graphic_eq,
                    color: Colors.grey[500],
                    size: 40
                  ),
                  label: Text('Statistics'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/statistics');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}