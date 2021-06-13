import 'package:flutter/material.dart';
import 'package:ninja_id_project/constants/algorithms.dart';
import 'package:ninja_id_project/pages/workoutpage.dart';
import 'package:ninja_id_project/services/training.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleWorkouts extends StatelessWidget {
  SingleWorkouts(this.currentGoal);

  List<int> currentGoal;
  static Training recommendedTraining;

  List<Training> trainings = [
    Training
    (
        name: "Steady-state jogging",
        color: Colors.red,
        duration: '30-45 min(based on stats)',
        icon: 'assets/heart.png',
        image: 'assets/runner3.png',
        details: '6 to 8 * 1,000m with no recovery jog(based on stats)',
        description:
            'Maintain a consistent speed, level of intensity and work rate during an exercise session. ',
        speedlvl: 2,
        endurancelvl: 4
    ),
    Training
    (
        name: "Toes poes",
        color: Colors.red,
        duration: '40 seconds',
        icon: 'assets/yoga.png',
        image: 'assets/yoga1.png',
        details: 'stretching the shins and arches of the feet',
        description:
            'To Do Kneel on your mat with your toes curled under. Sit back on your heels (you can place a yoga block or pillow between your heels and glutes). Breathe deeply for 10 counts. Then, point your toes, place your hands on the mat behind you, and lean back as you attempt to lift your knees off the mat. If your knees don’t come far up, don’t worry. You’ll still feel a nice stretch in your shins and arches.',
        speedlvl: 0,
        endurancelvl: 0
    ),
    Training
    (
        name: "Interval jogging",
        color: Colors.yellow,
        duration: '60 min(based on stats)', 
        icon: 'assets/heart.png',
        image: 'assets/tennis1.png',
        details: '6 to 8 * 1,000m with with recovery jog(based on stats)',
        description:
            'Alternate between periods of high-intensity exercise and lower-intensity, active or passive recovery.',
        speedlvl: 3,
        endurancelvl: 2
    ),
    Training
    (
        name: "Squats",
        color: Colors.purple,
        duration: '20 min', 
        icon: 'assets/stopwatch.png',
        image: 'assets/runner3.png',
        details: '3 sets of 12',
        description:
            'Start standing with feet just wider than hip-width apart, toes pointed slightly out, and hands clasped at chest for balance. Initiate the movement by sending your hips back first, then bend knees to lower down as far as possible while keeping your chest lifted. You should lower down until thighs are at least parallel to floor. Press through heels and engage glutes to return back to the starting position.',
        speedlvl: 1,
        endurancelvl: 1
    ),
    Training
    (
        name: "Cruise Intervals",
        color: Colors.red,
        duration: '30-45 min',
        icon: 'assets/heart.png',
        image: 'assets/runner3.png',
        details: '6 to 8 * 1,000m with 200m recovery jog',
        description: 'Description',
        speedlvl: 2,
        endurancelvl: 2
    ),
    Training
    (
        name: "Tempo Intervals",
        color: Colors.red,
        duration: '30 min',
        icon: 'assets/heart.png',
        image: 'assets/runner2.png',
        details: '4 to 5 * 2,000m WITH 400m recovery jog',
        description: 'Description',
        speedlvl: 3,
        endurancelvl: 1
    ),
    Training
    (
        name: "Goal Pace Run",
        color: Colors.yellow,
        duration: '60 min',
        icon: 'assets/heart.png',
        image: 'assets/tennis1.png',
        details: '8 to 12 miles at marathon pace',
        description: 'Description',
        speedlvl: 1,
        endurancelvl: 4
    ),
    Training
    (
        name: "Quarters",
        color: Colors.purple,
        duration: '30 min',
        icon: 'assets/stopwatch.png',
        image: 'assets/runner3.png',
        details: '8 to 10 * 2 mins with 1-min recovery jog',
        description: 'Description',
        speedlvl: 1,
        endurancelvl: 4
    )
  ];

  @override
  void initState() {
    getData();
  }

  List<int> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<int> tempGoal = new List<int>();
    tempGoal.add(prefs.getInt('goalSpeed'));
    tempGoal.add(prefs.getInt('goalEndurance'));
    return tempGoal;
  }

  @override
  Widget build(BuildContext context) {
    Algorithms algo = new Algorithms();
    getData();

    var sortedList = algo.sortTrainingScore(trainings, currentGoal);

    var recommendedTraining = sortedList[0];
    sortedList.removeAt(0);

    return Container(
      child: Column(
        children: [
          Container(
              height: 74,
              child: Column(
                children: [
                  ListTile(
                    tileColor: Colors.blue[600],
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(recommendedTraining.icon),
                      radius: 30,
                    ),
                    title: Text(
                      recommendedTraining.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    subtitle: Text(
                      'Recommended Training!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      size: 50,
                      color: Colors.black,
                    ),
                    isThreeLine: false,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutPage(
                                    training: recommendedTraining,
                                  )));
                    },
                  ),
                ],
              )),
          Container(
            height: 480,
            child: ListView.builder(
              itemCount: sortedList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(sortedList[index].icon),
                            radius: 30,
                          ),
                          title: Text(
                            sortedList[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            sortedList[index].details,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
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
                              MaterialPageRoute(
                                builder: (context) => WorkoutPage(
                                  training: sortedList[index],
                                ),
                              ),
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
  const BorderAndStrokeText(
      {Key key,
      @required this.text,
      @required this.fontSize,
      @required this.strokeWidth})
      : super(key: key);

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
