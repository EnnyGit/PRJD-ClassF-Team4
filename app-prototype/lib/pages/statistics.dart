import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0EBEE),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Statistics'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                height: 150,
                width: 200,
                child: Card(
                  elevation: 5,
                  child: Text(
                    'AVG. RESTING HEART RATE'
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                height: 150,
                width: 200,
                child: Card(
                  elevation: 5,
                  child: Text(
                    'AVG. PACE'
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                height: 150,
                width: 200,
                child: Card(
                  elevation: 5,
                  child: Text(
                    'TOTAL DISTANCE'
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),                 
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                height: 150,
                width: 200,
                child: Card(
                  elevation: 5,
                  child: Text(
                    'TIME SPENT RUNNING'
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
            height: 300,
            width: 500,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage('assets/graph.png'),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              elevation: 5,         
            ),
          ),
        ],
      )
    );
  }
}