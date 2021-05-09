import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0EBEE),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Your goals'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Text('Goals screen'),
    );
  }
}