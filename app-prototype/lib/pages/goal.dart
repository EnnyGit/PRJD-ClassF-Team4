import 'package:flutter/material.dart';
import 'package:ninja_id_project/constants/algorithms.dart';
import 'package:ninja_id_project/models/runtimes.dart';
import 'package:ninja_id_project/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Goal extends StatefulWidget {
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  RunTimes runTimes = new RunTimes();
  Algorithms algo = new Algorithms();

  String dropdownValue = 'Marathon';
  String secondDropDownValue;
  List<String> secondDropDownList;
  List<int> currentGoal = [1, 1];

  onPressed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('goalSpeed', 50);
    prefs.setInt('goalEndurance', 50);
  }

  void setDefaults() {
    secondDropDownList = runTimes.marathonAverage;
    secondDropDownValue = secondDropDownList[0];
  }

  @override
  void initState() {
    super.initState();
    setDefaults();
  }

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.pop(context);
            Navigator.pop(context, currentGoal);
          },
        ),
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
              "Goal:",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 3.0,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.blue[400],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Marathon', '20km', '10km', '5km']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                  child: DropdownButton<String>(
                    value: secondDropDownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        secondDropDownValue = newValue;
                        currentGoal[1] = int.parse(algo
                            .calculateEnduranceFromVomax(algo.calculateVDOT(
                                runTimes.marathonAverageSeconds[
                                        secondDropDownList
                                            .indexOf(secondDropDownValue)]
                                    .toDouble(),
                                42195))
                            .toStringAsFixed(0));
                        currentGoal[0] = int.parse(algo
                            .calculateSpeed(
                                runTimes.marathonAverageSeconds[
                                        secondDropDownList
                                            .indexOf(secondDropDownValue)]
                                    .toDouble(),
                                42)
                            .toStringAsFixed(0));
                      });
                    },
                    items: secondDropDownList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            indent: 40,
            endIndent: 40,
            height: 50.0,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Text(
                'The marathon is a long-distance race with an official distance of 42.195 kilometres (26 miles 385 yards),[1] usually run as a road race, but the distance can be covered on trail routes. The event was instituted in commemoration of the fabled run of the Greek soldier Pheidippides, a messenger from the Battle of Marathon to Athens, who reported the victory. The marathon can be completed by running or with a run/walk strategy. There are also wheelchair divisions.'),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
            height: 150,
            width: 360,
            child: Card(
              elevation: 0,
              color: Colors.blue[100],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      'Recommended stats:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: Column(
                          children: [
                            Text(
                              '${algo.calculateSpeed(runTimes.marathonAverageSeconds[secondDropDownList.indexOf(secondDropDownValue)].toDouble(), 42).toStringAsFixed(0)}',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                            Text(
                              'Speed',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            Text(
                              '${algo.getTrainingLevelRequired(runTimes.marathonAverageSeconds[secondDropDownList.indexOf(secondDropDownValue)].toDouble()).toStringAsFixed(0)}',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                            Text(
                              'Training',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                          children: [
                            Text(
                              '${algo.calculateEnduranceFromVomax(algo.calculateVDOT(runTimes.marathonAverageSeconds[secondDropDownList.indexOf(secondDropDownValue)].toDouble(), 42195)).toStringAsFixed(0)}',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(
                              'Endurance',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
