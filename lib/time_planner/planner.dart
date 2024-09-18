import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_planner/time_planner.dart';

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var now=DateTime.now();

    int dayOfYear = now.day + DateTime(now.year, now.month).difference(DateTime(now.year, 1)).inDays;
    List<TimePlannerTask> tasks = [
      TimePlannerTask(
        color: Colors.purple,
        dateTime:TimePlannerDateTime(day: dayOfYear, hour: 12, minutes: 00),
        minutesDuration: 30,
        daysDuration: 1,
        onTap: () {
          // Handle task tap
          print("Task tapped!");
        },
        child: Container(
          color: Colors.purple,
          child: Center(
            child: Text(
              'This is a task',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
    ];
       // Generate headers for a full year
    List<TimePlannerTitle> headers = [];
    DateTime currentDate = DateTime.now();
    DateTime startOfYear = DateTime(currentDate.year, 1, 1);
    DateTime endOfYear = DateTime(currentDate.year, 12, 31);

    for (DateTime date = startOfYear; date.isBefore(endOfYear.add(Duration(days: 1))); date = date.add(Duration(days: 1))) {
      headers.add(TimePlannerTitle(
        date: DateFormat('M/d/yyyy').format(date), // Format the date as needed
        title: DateFormat('EEEE').format(date), // Get the day of the week
      ));
    }

    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: Scaffold(
        appBar: AppBar(title: Text('Time Planner')),
        body: TimePlanner(
          startHour: 6,
          endHour: 23,
          headers: headers,
          tasks: tasks,
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

// void main() {
//   runApp(MyApp());
// }
