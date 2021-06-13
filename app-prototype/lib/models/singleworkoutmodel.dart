import 'package:flutter/material.dart';
import 'package:ninja_id_project/services/training.dart';

class SingleWorkouts {
  List<Training> trainingList = [
    Training(
        speedReq: 20,
        endReq: 20,
        name: "Steady-state jogging",
        color: Colors.red,
        duration: '30-45 min(based on stats)', //this needs to be based on stats
        icon: 'assets/heart.png',
        details: '6 to 8 * 1,000m with no recovery jog(based on stats)',
        description:
            'Maintain a consistent speed, level of intensity and work rate during an exercise session. ',
        speedlvl: 0,
        endurancelvl: 2),
    Training(
        speedReq: 40,
        endReq: 40,
        name: "Toes poes",
        color: Colors.red,
        duration: '40 seconds',
        icon: 'assets/yoga.png',
        details: 'stretching the shins and arches of the feet',
        description:
            'To Do Kneel on your mat with your toes curled under. Sit back on your heels (you can place a yoga block or pillow between your heels and glutes). Breathe deeply for 10 counts. Then, point your toes, place your hands on the mat behind you, and lean back as you attempt to lift your knees off the mat. If your knees don’t come far up, don’t worry. You’ll still feel a nice stretch in your shins and arches.',
        speedlvl: 0,
        endurancelvl: 0),
    Training(
        speedReq: 60,
        endReq: 60,
        name: "Interval jogging",
        color: Colors.yellow,
        duration: '60 min(based on stats)', //this needs to be based on stats
        icon: 'assets/heart.png',
        details: '6 to 8 * 1,000m with with recovery jog(based on stats)',
        description:
            'Alternate between periods of high-intensity exercise and lower-intensity, active or passive recovery.',
        speedlvl: 0,
        endurancelvl: 2),
    Training(
        speedReq: 80,
        endReq: 80,
        name: "Squats",
        color: Colors.purple,
        duration: '20 min', //maybe also based on stats?
        icon: 'assets/stopwatch.png',
        details: '3 sets of 12',
        description:
            'Start standing with feet just wider than hip-width apart, toes pointed slightly out, and hands clasped at chest for balance. Initiate the movement by sending your hips back first, then bend knees to lower down as far as possible while keeping your chest lifted. You should lower down until thighs are at least parallel to floor. Press through heels and engage glutes to return back to the starting position.',
        speedlvl: 1,
        endurancelvl: 1),
  ];

  List<Training> fakeTrainingList = [
    Training(
        name: "Cruise Intervals",
        color: Colors.red,
        duration: '30-45 min',
        icon: 'assets/heart.png',
        details: '6 to 8 * 1,000m with 200m recovery jog',
        description: 'Description',
        speedlvl: 0,
        endurancelvl: 2),
    Training(
        name: "Tempo Intervals",
        color: Colors.red,
        duration: '30 min',
        icon: 'assets/heart.png',
        details: '4 to 5 * 2,000m WITH 400m recovery jog',
        description: 'Description',
        speedlvl: 0,
        endurancelvl: 1),
    Training(
        name: "Yasso 800s",
        color: Colors.yellow,
        duration: '20-25 min',
        icon: 'assets/stopwatch.png',
        details: '8 to 10 * 800m with equal recovery jog',
        description: 'Description',
        speedlvl: 2,
        endurancelvl: 1),
    Training(
        name: "Goal Pace Run",
        color: Colors.yellow,
        duration: '60 min',
        icon: 'assets/heart.png',
        details: '8 to 12 miles at marathon pace',
        description: 'Description',
        speedlvl: 0,
        endurancelvl: 2),
    Training(
        name: "Quarters",
        color: Colors.purple,
        duration: '30 min',
        icon: 'assets/stopwatch.png',
        details: '8 to 10 * 2 mins with 1-min recovery jog',
        description: 'Description',
        speedlvl: 1,
        endurancelvl: 1),
  ];

  void getTrainingList() {
    int currentSpeed = 65;
    int currentEndurance = 24;

    for (var training in trainingList) {
      if (training.speedReq >= currentSpeed) ;
    }
  }
}
