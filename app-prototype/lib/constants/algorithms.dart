import 'dart:math';

import 'package:ninja_id_project/models/singleworkoutmodel.dart';
import 'package:ninja_id_project/services/API_intergration.dart';
import 'package:ninja_id_project/services/training.dart';

class Algorithms {

  double getEndurance(int age, int restingHeartRate) {
    double vomax = 15.3 * (220 - age) / restingHeartRate;
    return (vomax - 32) * 3.33;
  }

  double calculateSpeed(double durationInSec, double distanceInKM){
    double riegelTime5k = durationInSec * pow((5 / (distanceInKM / 1.60934)), 1.06);
    double pace = riegelTime5k / 5;
    return 0.1428571429 * (1000 - pace);
  }

  double calculateVDOT(double raceTimeInSeconds, double distanceInMeters){
    double percent_Max = 0.8 + 0.1894393 * exp(-0.012778 * raceTimeInSeconds) + 0.2989558 * exp(-0.1932605 * raceTimeInSeconds);
    double velocity = distanceInMeters / (raceTimeInSeconds / 60);
    double vomax = -4.60 + 0.182258 * velocity + 0.000104 * pow(velocity,2);
    //print(vomax / percent_Max);
    if((vomax / percent_Max) < 32){
      return 32;
    } else {
      return vomax / percent_Max;
    }
  }

  double calculateEnduranceFromVomax(double vomax){
    return (vomax - 32) * 3.33;
  }

  double getTrainingLevelRequired(double raceTimeInSeconds) {
    if (raceTimeInSeconds < 15993) {
      return 100;
    } else if (raceTimeInSeconds == 15993) {
      return 86;
    } else if (raceTimeInSeconds == 17538) {
      return 73;
    } else if (raceTimeInSeconds == 20505) {
      return 60;
    }
  }

  int calculateTrainingScore(Training training, List<int> currentGoal)   {
    int speed = ApiIntergration.speed.truncate();
    int endurance = ApiIntergration.endurance.truncate();
    return training.speedlvl * (currentGoal[0] - speed) + 
           training.endurancelvl * (currentGoal[1] - endurance);
  }

  List<Training> sortTrainingScore(List<Training> list, List<int> currentGoal){
    List<Pair<Training,int>> trainingScoreList = new List<Pair<Training,int>>();
    List<Training> sortedList = new List<Training>();

    for(var training in list){
      trainingScoreList.add(new Pair(training, calculateTrainingScore(training, currentGoal)));
    }
    
    trainingScoreList.sort((a, b) => b.two.compareTo(a.two));

    for(var pair in trainingScoreList){
      sortedList.add(pair.one);
    }

    return sortedList;
  }
}

class Pair<T1, T2> {
  final T1 one;
  final T2 two;

  Pair(this.one, this.two);
}