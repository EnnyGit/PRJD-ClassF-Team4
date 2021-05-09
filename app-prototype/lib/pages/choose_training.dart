import 'package:flutter/material.dart';
import 'package:ninja_id_project/services/training.dart';

class ChooseTraining extends StatefulWidget {
  @override
  _ChooseTrainingState createState() => _ChooseTrainingState();
}

class _ChooseTrainingState extends State<ChooseTraining> {

  List<Training> trainings = [
    Training(name: "Runners Workout", color: Colors.red, duration: '30-45 min', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    Training(name: "Workout #2", color: Colors.red, duration: '30 min', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    Training(name: "Workout #3", color: Colors.yellow, duration: '20-25 min', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    Training(name: "Workout #4", color: Colors.yellow, duration: '60 min', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    Training(name: "Workout #5", color: Colors.purple, duration: '30 min', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0EBEE),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Training'),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: ListView.builder(
        itemCount: trainings.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Card(
              child: ListTile(        
                leading: Icon(Icons.fitness_center, size: 40,),
                title: Text(trainings[index].name),
                subtitle: Text(trainings[index].description),
                trailing: Icon(Icons.navigate_next),
                isThreeLine: true,
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}