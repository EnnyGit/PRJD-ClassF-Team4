import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NinjaCard(),
));

// This is the widget itself that creates a state object.
class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

// This is the state object that contains data and returns this widget tree:
// 1. We can output data we create in the widget tree.
// 2. When that data changes, this tree will update to reflect changes.
class _NinjaCardState extends State<NinjaCard> {

  int fitnessLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0EBEE),
      // appBar: AppBar(
      //   title: Text('Ninja ID Card'),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey[850],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fitnessLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/user2.jpg'),
                  radius: 40.0,
              ),
            ),
            Divider(
              height: 90.0,
              color: Colors.blue[800],
            ),
            Center(
              child: Text(
                'Enny Pogchamp',
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
            SizedBox(height: 80.0),
            Row(children: <Widget>[
              Text(
                'Level: $fitnessLevel',
                style: TextStyle(
                  color: Colors.blue[800],
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                  ),
                ),
              SizedBox(width: 100.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Endurance: 99',
                    style: TextStyle(
                      color: Colors.lightGreen[900],
                      letterSpacing: 2.0,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Sleep: 23',
                    style: TextStyle(
                      color: Colors.purple[600],
                      letterSpacing: 2.0,
                      fontSize: 18,  
                    )                 
                  ),
                  Text(
                    'Speed: 77',
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
            SizedBox(height: 10.0),
            Text(
              '8',
              style: TextStyle(
                color: Colors.blue[800],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[800],
                ),
                SizedBox(width: 10.0),
                Text(
                  'theennyk@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 18.0
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}