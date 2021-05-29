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
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                height: 150,
                width: 200,
                child: Card(
                  elevation: 5,
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
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                height: 150,
                width: 200,
                child: Card(
                  elevation: 5,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 45, 20),
            height: 300,
            width: 500,
          ),
        ],
      )
    );
  }
}