import 'package:flutter/material.dart';
import 'package:ninja_id_project/pages/workoutpage.dart';
import 'package:ninja_id_project/services/training.dart';

class SingleWorkouts extends StatelessWidget {

  List<Training> trainings = [
      Training(name: "Steady-state jogging",
      color: Colors.red,
      duration: '30-45 min(based on stats)', //this needs to be based on stats
      icon: 'assets/stopwatch.png',
      image: 'assets/runner3.png',
      details: '6 to 8 * 1,000m with no recovery jog(based on stats)',
      description: 'Maintain a consistent speed, level of intensity and work rate during an exercise session. '),

      Training(name: "Toes poes",
      color: Colors.red,
      duration: '40 seconds',
      icon: 'assets/sport.png',
      image: 'assets/yoga1.png',
      details: 'stretching the shins and arches of the feet',
      description: 'To Do Kneel on your mat with your toes curled under. Sit back on your heels (you can place a yoga block or pillow between your heels and glutes). Breathe deeply for 10 counts. Then, point your toes, place your hands on the mat behind you, and lean back as you attempt to lift your knees off the mat. If your knees don’t come far up, don’t worry. You’ll still feel a nice stretch in your shins and arches.'),

      Training(name: "Yasso 800s",
      color: Colors.yellow,
      duration: '20-25 min',
      icon: 'assets/sport.png',
      image: 'assets/boxing1.png', 
      details: '8 to 10 * 800m with equal recovery jog',
      description: 'Description'),

      Training(name: "Interval jogging",
      color: Colors.yellow,
      duration: '60 min(based on stats)', //this needs to be based on stats
      icon: 'assets/trainers.png',
      image: 'assets/tennis1.png',
      details: '6 to 8 * 1,000m with with recovery jog(based on stats)',
      description: 'Alternate between periods of high-intensity exercise and lower-intensity, active or passive recovery.'),

      Training(name: "Quarters",
      color: Colors.purple,
      duration: '30 min',
      icon: 'assets/sport.png',
      image: 'assets/runner3.png',
      details: '8 to 10 * 2 mins with 1-min recovery jog',
      description: 'Description'),

      Training(name: "Cruise Intervals",
      color: Colors.red,
      duration: '30-45 min',
      icon: 'assets/sport.png',
      image: 'assets/runner3.png',
      details: '6 to 8 * 1,000m with 200m recovery jog',
      description: 'Description'),

      Training(name: "Tempo Intervals",
      color: Colors.red,
      duration: '30 min',
      icon: 'assets/sport.png',
      image: 'assets/runner2.png',
      details: '4 to 5 * 2,000m WITH 400m recovery jog',
      description: 'Description'),

      Training(name: "Yasso 800s",
      color: Colors.yellow,
      duration: '20-25 min',
      icon: 'assets/sport.png',
      image: 'assets/boxing1.png',
      details: '8 to 10 * 800m with equal recovery jog',
      description: 'Description'),

      Training(name: "Goal Pace Run",
      color: Colors.yellow,
      duration: '60 min',
      icon: 'assets/sport.png',
      image: 'assets/tennis1.png',
      details: '8 to 12 miles at marathon pace',
      description: 'Description'),
      
      Training(name: "Quarters",
      color: Colors.purple,
      duration: '30 min',
      icon: 'assets/sport.png',
      image: 'assets/runner3.png',
      details: '8 to 10 * 2 mins with 1-min recovery jog',
      description: 'Description')
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 555,
            child: ListView.builder(
              itemCount: trainings.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              trainings[index].image,
                            ),
                          ),
                        ),
                        child: ListTile(        
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(trainings[index].icon),
                            radius: 30,
                          ),
                          title: BorderAndStrokeText(
                            text: trainings[index].name,
                            fontSize: 20,
                            strokeWidth: 3,
                          ),
                          subtitle: Text(
                            trainings[index].details,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            size: 50,
                            color: Colors.black,
                          ),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkoutPage(training: trainings[index],))
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BorderAndStrokeText extends StatelessWidget {
  const BorderAndStrokeText({
    Key key,
    @required this.text,
    @required this.fontSize,
    @required this.strokeWidth
  }) : super(key: key);

  final String text;
  final double fontSize;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = Colors.black,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}