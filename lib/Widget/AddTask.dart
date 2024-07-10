// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class Add_Task extends StatefulWidget {
  final Function Addtx;

  Add_Task(this.Addtx);

  @override
  State<Add_Task> createState() => _Add_TaskState();
}

class _Add_TaskState extends State<Add_Task> {
  final Taskconroller = TextEditingController();

  late DateTime DateTimeInput = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Task'),
            autofocus: true,
            controller: Taskconroller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateTimeInput == DateTime.now()
                    ? 'Pick Date'
                    : DateFormat.yMMMd().add_jm().format(DateTimeInput),
                style: TextStyle(fontFamily: 'CascadiaCode', fontSize: 24),
              ),
              IconButton(
                icon: Icon(Icons.calendar_month),
                onPressed: () {
                  DatePicker.showDateTimePicker(
                    context,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2025),
                    onChanged: (date) {
                      print('change $date');
                    },
                    onConfirm: (date) {
                      print('Confirm $date');
                    },
                  ).then((pickeddate) {
                    if (pickeddate == DateTime(2000, 01, 01)) {
                      return;
                    }
                    setState(() {
                      DateTimeInput = pickeddate!;
                    });
                  });
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              widget.Addtx(Taskconroller.text, DateTimeInput);
            },
            child: Text(
              'Create',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
