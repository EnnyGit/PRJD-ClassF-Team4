import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';
import 'package:collection/algorithms.dart';
import 'package:ninja_id_project/constants/algorithms.dart';
import 'package:intl/intl.dart';

class ApiIntergration {
  String accessToken;
  int restingHeartRate; // most recent calculated resting heart rate
  int age;
  static double endurance; // VO2max calculated from age + restingHeartrate
  static double speed; //TODO: better calculation
  String name; //TODO: Pak name van Fitbit
  String location; //TODO: Pak location van phone?
  int level;
  int sleepScore;
  String displayName;
  Algorithms algo = new Algorithms();
  int activityCount;
  int activityLevel;

  ApiIntergration({this.accessToken});

  Future<void> getRestingHeartRate() async {
    try {
      // The range for which data will be returned. Options are 1d, 7d, 30d, 1w, 1m.
      String period = '1m';

      Response response = await get(
          Uri.parse(
              "https://api.fitbit.com/1/user/-/activities/heart/date/today/$period.json"),
          headers: {"Authorization": "Bearer " + accessToken});

      Map<String, dynamic> data = json.decode(response.body);

      for (var heartActivity in data['activities-heart']) {
        var tempHeartRate = heartActivity['value']['restingHeartRate'];
        if (tempHeartRate != null) {
          restingHeartRate = tempHeartRate;
          break;
        }
      }
    } catch (e) {
      print('caught error in getRestingHeartRate(): $e');
    }
  }

  Future<void> getAge() async {
    try {
      Response response = await get(
          Uri.parse("https://api.fitbit.com/1/user/99YY8D/profile.json"),
          headers: {"Authorization": "Bearer " + accessToken});

      Map<String, dynamic> data = json.decode(response.body);
      age = data['user']['age'];
      displayName = data['user']['displayName'];
    } catch (e) {
      print('caught error in getAge(): $e');
    }
  }

  void getEndurance() {
    double vomax = 15.3 * (220 - age) / restingHeartRate;
    endurance = (vomax - 32) * 3.33;
  }

  Future<void> getSpeed() async {
    try {
      //The max of the number of entries returned (maximum: 100). Required.
      String limit = '100';

      Response response = await get(
          Uri.parse(
              "https://api.fitbit.com/1/user/-/activities/list.json?afterDate=2020-01-01&sort=desc&offset=0&limit=$limit"),
          headers: {"Authorization": "Bearer " + accessToken});

      Map<String, dynamic> data = json.decode(response.body);

      var runActivity;
      for (var activity in data['activities']) {
        var tempActivity = activity['activityName'];
        if (tempActivity == 'Run') {
          runActivity = activity;
          break;
        }
      }
      speed = algo.calculateSpeed(runActivity['duration'] / 1000, runActivity['distance']);
    } catch (e) {
      print('caught error in getSpeed(): $e');
    }
  }

  double calculateRiegel5K(double duration, double distance) {
    double riegelTime5k = duration / 1000 * (pow((5 / distance), 1.06));
    double riegelPace = riegelTime5k / 5;
    return riegelPace;
  }

  Future<void> getSleepScore() async {
    try {
      Response response = await get(
          Uri.parse(
              "https://api.fitbit.com/1.2/user/-/sleep/list.json?afterDate=2020-01-01&sort=desc&offset=0&limit=1"),
          headers: {"Authorization": "Bearer " + accessToken});

      Map<String, dynamic> data = json.decode(response.body);

      sleepScore = data['sleep'][0]['efficiency'];
    } catch (e) {
      print('caught error in getSleepScore: $e');
    }
  }

  Future<void> getTotalSteps() async {
    try {
      Response response = await get(
        Uri.parse(
            "https://api.fitbit.com/1.2/user/-/sleep/list.json?afterDate=2020-01-01&sort=desc&offset=0&limit=1"),
        headers: {"Authorization": "Bearer " + accessToken});

      Map<String, dynamic> data = json.decode(response.body);
      //TODO: Finish
    } catch (e) {
      print('caught error in getTotalSteps: $e');
    }
  }

  Future<void> getAmountOfRuns() async {
    try {
      var date = DateTime.now();
      var lastMonth = new DateTime(date.year, date.month -1, date.day);
      var formattedDate = DateFormat('yyyy-MM-dd').format(lastMonth);

      Response response = await get(
        Uri.parse(
          "https://api.fitbit.com/1/user/-/activities/list.json?afterDate=$formattedDate&sort=desc&offset=0&limit=100"),
        headers: {"Authorization": "Bearer " + accessToken});
        Map<String, dynamic> data = json.decode(response.body);

      activityCount = 0;
      for (var activity in data['activities']) {
        if (activity['activityName'] == 'Walk') {
          activityCount ++;
        }
      }

      if(activityCount >= 20) {
        activityLevel = 100;
      } else {
        activityLevel = activityCount * 5;
      }
      //print(activityLevel);
    } catch (e) {
      print('caught error in getAmountOfRuns: $e');
    }
  }
}
