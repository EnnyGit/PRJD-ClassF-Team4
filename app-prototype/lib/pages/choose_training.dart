import 'package:flutter/material.dart';
import 'package:ninja_id_project/pages/weeklyworkouts.dart';
import 'package:ninja_id_project/pages/singleworkouts.dart';
import 'singleworkouts.dart';

class ChooseTraining extends StatefulWidget {
  @override
  _ChooseTrainingState createState() => _ChooseTrainingState();
}

class _ChooseTrainingState extends State<ChooseTraining> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Color(0xFFE0EBEE),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Training'),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Single Workout'),
              Tab(text: 'Training Schedule'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleWorkout(),
            WeeklyWorkouts(data['currentGoal']),
          ],
        ),
      ),
    );
  }
}
