import 'package:flutter/material.dart';
import 'package:ninja_id_project/constants/algorithms.dart';
import 'package:ninja_id_project/pages/workoutpage.dart';
import 'package:ninja_id_project/services/training.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WeeklyWorkouts extends StatefulWidget {
  @override
  _WeeklyWorkouts createState() => _WeeklyWorkouts();
}

class _WeeklyWorkouts extends State<WeeklyWorkouts> {
  int speed = 100;
  int endurance = 100;

  List<int> currentGoal;

  List<Training> trainings = [
    Training(
      name: "marathon",
      color: Colors.yellow,
      duration: '20-25 min (d.o.l.)',
      image: 'assets/tennis1.png',
      icon: 'assets/heart.png',
      details: '15-20km (d.o.l.) tempo run at marathon pace(7 min)',
      description:
          'this schedule is made to help you build up the strength to run a marathon',
      speedlvl: 2,
      endurancelvl: 4,
    ),
    Training(
      name: "Tempo Run",
      color: Colors.red,
      duration: '30-45 min', 
      image: 'assets/tennis1.png',
      icon: 'assets/stopwatch.png',
      details: '5 TO 7 Miles with progressive pacing',
      description:
          'Jack Daniels popularized “cruise intervals” in his book Daniels’ Running Formula, and I’ve found them to be the perfect start to your more intense marathon training. Start with six to eight 1,000m repeats, jogging for only 200 meters between each repeat. Run these at between 10K and 15K race pace. It’s a good idea to start them at 15K pace and progress to 10K pace during your last repeats if possible.',
      speedlvl: 4,
      endurancelvl: 2,
    ),
    Training(
      name: "1200m Repeats",
      color: Colors.red,
      duration: '30 min',
      image: 'assets/boxing1.png',
      icon: 'assets/heart.png',
      details: '5-6x 1200m @ 10K-5K pace; 2:00 static / jog recoveries',
      description:
          'In Workout 2, you double the distance of the repeat as well as the recovery jog from Workout 1. The pace may be slightly slower, but not by much. Again, work on running a strong steady pace and focus on volume of running, not speed. Complete at least four and up to five repetitions. Make you last two repetitions your strongest. Many runners find that starting this workout at half marathon pace and progressing down to near 10K race pace is ideal.',
      speedlvl: 1,
      endurancelvl: 3,
    ),
    Training(
      name: "Race Simulator Tempo ",
      color: Colors.yellow,
      duration: '20-25 min',
      image: 'assets/tennis1.png',
      icon: 'assets/stopwatch.png',
      details: '15-20km tempo run at marathon pace',
      description:
          'I’m a fan of Yasso 800s (I’m also a fan of Bart Yasso, the workout’s eponym). This workout not only provides a great stimulus to get fitter, but is also a good predictor of your marathon potential.',
      speedlvl: 3,
      endurancelvl: 2,
    ),
  ];

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      speed = prefs.getInt('goalSpeed');
      endurance = prefs.getInt('goalEndurance');
    });
  }

  @override
  Widget build(BuildContext context) {
    Algorithms algo = new Algorithms();

    var sortedList = algo.sortTrainingScore(trainings, [speed, endurance]);

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
                      MaterialPageRoute(builder: (context) => WorkoutPage(training: recommendedTraining,))
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 480,
            child: ListView.builder(
              itemCount: sortedList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue[300]),
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
                              MaterialPageRoute(builder: (context) => WorkoutPage(training: sortedList[index]
                              )
                              )
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
