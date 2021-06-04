import 'package:flutter/material.dart';
import 'package:ninja_id_project/services/API_intergration.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMkM2QksiLCJzdWIiOiI5OVlZOEQiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyc29jIHJzZXQgcmFjdCBybG9jIHJ3ZWkgcmhyIHJudXQgcnBybyByc2xlIiwiZXhwIjoxNjUyMDQzNTcwLCJpYXQiOjE2MjA1MDc1NzB9.pfbgjL6d2rIzlAq37MuL186uxNalfkMfPiLJ0T-SnHI";

  void setupFitbitApi() async{

    ApiIntergration fitbitApi = ApiIntergration(accessToken: accessToken);
    await fitbitApi.getRestingHeartRate();
    await fitbitApi.getAge();
    fitbitApi.getEndurance();
    await fitbitApi.getSpeed();
    await fitbitApi.getSleepScore();
    await fitbitApi.getAmountOfRuns();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'endurance': fitbitApi.endurance,
      'speed': fitbitApi.speed,
      'sleep': fitbitApi.sleepScore,
      'level': ((fitbitApi.endurance * 0.4 )+ (fitbitApi.speed * 0.4) + (fitbitApi.sleepScore * 0.2)),
      'displayName': fitbitApi.displayName,
      'activity': fitbitApi.activityLevel
    });
  }

  @override
  void initState() {
    super.initState();
    setupFitbitApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}