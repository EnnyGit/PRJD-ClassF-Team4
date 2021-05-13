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
            SizedBox(height: 40.0),
            Row(children: <Widget>[
              SizedBox(width: 10.0),
              SizedBox(
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: data['level']/100,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          '${data['level'].toStringAsFixed(0)}',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 75.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StatBar(statData: data['endurance'], color: Colors.green),
                  StatText(statText: 'Endurance'),    
                  StatBar(statData: data['sleep'], color: Colors.purple,),
                  StatText(statText: 'Sleep'),  
                  StatBar(statData: data['speed'], color: Colors.amber,),
                  StatText(statText: 'Speed')                                         
                  ],
                ),
              ]
            ),          
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
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
            ),
          ],
        ),
      ),
    );
  }
}

class StatText extends StatelessWidget {
  const StatText({
    Key key,
    @required this.statText,
  }) : super(key: key);

  final String statText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
      child: Text(
        statText,
        style: TextStyle(
          color: Colors.blue[800],
          letterSpacing: 2.0,
          fontSize: 13,  
          fontWeight: FontWeight.bold
        )                 
      ),
    );
  }
}

class StatBar extends StatelessWidget {
  const StatBar({
    Key key,
    @required this.statData,
    @required this.color
  }) : super(key: key);

  final dynamic statData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
      Text(
        '${statData.toStringAsFixed(0)}',
        style: TextStyle(
          color: Colors.blue[800],
          letterSpacing: 2.0,
          fontSize: 18,  
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: LinearProgressIndicator(
            value: statData/100,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        width: 120,
        height: 7,
        ),                   
      ],
    );
  }
}