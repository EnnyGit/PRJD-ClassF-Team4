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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          'AVG. RHR',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          '64',
                          style: TextStyle(
                            color: Color(0xFFFF4242),
                            fontSize: 40,
                            fontWeight: FontWeight.bold 
                          ),
                        ),
                      ),
                    ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          'AVG. PACE (/km)',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          '8.21',
                          style: TextStyle(
                            color: Color(0xFF645DD7),
                            fontSize: 40,
                            fontWeight: FontWeight.bold 
                          ),
                        ),
                      ),
                    ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          'TOTAL DISTANCE',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                        child: Text(
                          '24,321 m',
                          style: TextStyle(
                            color: Color(0xFF69DC9E),
                            fontSize: 30,
                            fontWeight: FontWeight.bold 
                          ),
                        ),
                      ),
                    ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          'TIME RUNNING',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                        child: Text(
                          '7.5h',
                          style: TextStyle(
                            color: Color(0xFFFF9F1C),
                            fontSize: 30,
                            fontWeight: FontWeight.bold 
                          ),
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
          //   height: 300,
          //   width: 500,
          //   child: Card(
          //     semanticContainer: true,
          //     clipBehavior: Clip.antiAliasWithSaveLayer,
          //     child: Image(
          //       image: AssetImage('assets/graph.png'),
          //       fit: BoxFit.fill,
          //     ),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10)
          //     ),
          //     elevation: 5,         
          //   ),
          // ),
        ],
      )
    );
  }
}