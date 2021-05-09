import 'package:flutter/material.dart';

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
      body: Text('Statistics screen'),
    );
  }
}