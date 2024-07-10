// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './DataTypes/Tasks.dart';
import './Widget/AddTask.dart';
import 'Widget/ShowTask.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      home: To_Do_App(),
    );
  }
}

class To_Do_App extends StatefulWidget {
  const To_Do_App({super.key});

  @override
  State<To_Do_App> createState() => _To_Do_AppState();
}

class _To_Do_AppState extends State<To_Do_App> {
  final List<Tasks> To_Do_list = [];

  void _ShowNewTaskTab(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Add_Task(_AddNewTask);
        });
  }

  void _AddNewTask(String Task, DateTime Time) {
    final newTask = Tasks(
        task: Task, time: Time, isDone: false, id: DateTime.now().toString());
    setState(() {
      To_Do_list.add(newTask);
    });
    Navigator.pop(context);
  }

  void DeleteTask(String id) {
    setState(() {
      To_Do_list.removeWhere((tx) => tx.id == id);
    });
  }

  final now = DateTime.now();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Image.asset('Assets/todo.png'),
          title: const Text(
            'Tasks',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'CascadiaCode',
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Showtask(To_Do_list, DeleteTask, _ShowNewTaskTab),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _ShowNewTaskTab(context);
          },
          child: const Icon(Icons.add),
        ));
  }
}
