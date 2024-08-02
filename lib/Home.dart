import 'package:flutter/material.dart';
import 'package:flutter_class2/Job.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List jobs = [
    Job(name: 'Jr. Software Engineer', degree: 'BSC', description: 'Web Developer', minimum_years_of_experience: 3),
    Job(name: 'Sr. Software Engineer', degree: 'MSC', description: 'Web Developer', minimum_years_of_experience: 6),
    Job(name: 'Teacher', degree: 'HSC', description: 'Primary School Teacher', minimum_years_of_experience: 2),
    Job(name: 'Chef', degree: 'HSC', description: 'Cooking', minimum_years_of_experience: 3),
    Job(name: 'Senior Lecturer', degree: 'MSC', description: 'Lecturer in science', minimum_years_of_experience: 10),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job App', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: jobs.map((i) {
              return Card(
                elevation: 3,
                child: Container(
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Column(
                    children: [
                      Text('Job Name: ${i.name}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Job Description: ${i.description}'),
                      Text('Job Requirement: ${i.degree}'),
                      Text('Minimum Experience: ${i.minimum_years_of_experience} years'),

                      SizedBox(height: 10,),

                      GestureDetector(
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Apply'),
                              Icon(Icons.done)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
