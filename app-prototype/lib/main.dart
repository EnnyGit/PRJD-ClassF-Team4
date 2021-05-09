import 'package:flutter/material.dart';
import 'package:ninja_id_project/pages/home.dart';
import 'package:ninja_id_project/pages/choose_training.dart';
import 'package:ninja_id_project/pages/goal.dart';
import 'package:ninja_id_project/pages/loading.dart';
import 'package:ninja_id_project/pages/statistics.dart';
import 'package:ninja_id_project/pages/workout.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/choose_training': (context) => ChooseTraining(),
    '/workout': (context) => Workout(),
    '/goal': (context) => Goal(),
    '/statistics': (context) => Statistics()
  },
));

