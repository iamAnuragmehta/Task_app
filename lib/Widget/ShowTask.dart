import 'package:flutter/material.dart';
import '../DataTypes/Tasks.dart';
import 'package:intl/intl.dart';

class Showtask extends StatefulWidget {
  List<Tasks> To_Do_list;
  final Function DeleteTask;
  final Function _ShowNewTaskTab;

  Showtask(this.To_Do_list, this.DeleteTask, this._ShowNewTaskTab);

  @override
  State<Showtask> createState() => _ShowtaskState();
}

class _ShowtaskState extends State<Showtask> {
  @override
  Widget build(BuildContext context) {
    return widget.To_Do_list.isEmpty
        ? Column(
            children: [
              GestureDetector(
                onTap: () => widget._ShowNewTaskTab(context),
                child: Image.asset(
                  'Assets/AddYourTask.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView(
            children: [
              Column(
                children: widget.To_Do_list.map(
                  (tx) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: Checkbox(
                            value: tx.isDone,
                            onChanged: (value) {
                              setState(() {
                                tx.isDone = value!;
                              });
                            }),
                        tileColor: tx.isDone == false
                            ? DateTime.now().isAfter(tx.time)
                                ? Colors.red[400]
                                : Colors.orange[400]
                            : Colors.green[200],
                        title: Text(tx.task,
                            style: TextStyle(
                                decoration: tx.isDone == true
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontFamily: 'CascadiaCode',
                                fontSize: 28)),
                        subtitle: Text(
                          DateFormat.yMMMMd().add_jm().format(tx.time),
                          style: TextStyle(
                            fontSize: 24,
                            decoration: tx.isDone == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              widget.DeleteTask(tx.id);
                            },
                            icon: const Icon(
                              Icons.delete,
                            )),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          );
  }
}
