import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_planner/time_planner.dart';
import 'package:todo/module/api.dart';



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlannerPage(),
    );
  }
}

class PlannerPage extends StatefulWidget {
  @override
  _PlannerPageState createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  // List of days for the planner
  final List<String> days = List.generate(30, (index) => 'Day ${index + 1}');
  int? selectedDayIndex;
  Map<int, List<String>> tasks = {};

  // Function to add a task
  void addTask(int dayIndex, String task) {
    setState(() {
      if (tasks[dayIndex] == null) {
        tasks[dayIndex] = [];
      }
      tasks[dayIndex]!.add(task);
    });
  }
    Color back =  Colors.black;
      Color b = Color.fromARGB(255, 255, 94, 0);
      Color a = Color.fromARGB(248, 53, 52, 52);

  @override
  Widget build(BuildContext context) {
       //  List<TimePlannerTitle> headers = [];
    // DateTime currentDate = DateTime.now();
    // DateTime startOfYear = DateTime(currentDate.year, 1, 1);
    // DateTime endOfYear = DateTime(currentDate.year, 12, 31);

    // for (DateTime date = startOfYear; date.isBefore(endOfYear.add(Duration(days: 1))); date = date.add(Duration(days: 1))) {
    //   headers.add(TimePlannerTitle(
    //     date: DateFormat('M/d/yyyy').format(date), // Format the date as needed
    //     title: DateFormat('EEEE').format(date), // Get the day of the week
    //   ));
    // }]
  

  // Example: User selects March 2023
  int selectedMonth=DateTime.now().month; // March
  int selectedYear = 2024;
List<TimePlannerTitle> headers = [];
 // void updateHeaders() {
  // headers.clear(); // Clear previous headers
    DateTime startOfMonth = DateTime(selectedYear, selectedMonth, 1);
    DateTime endOfMonth = DateTime(selectedYear, selectedMonth + 1, 0); // Last day of the month

    for (DateTime date = startOfMonth; date.isBefore(endOfMonth.add(Duration(days: 1))); date = date.add(Duration(days: 1))) {
      headers.add(TimePlannerTitle(
        date: DateFormat('M/d/yyyy').format(date), // Format the date as needed
        title: DateFormat('EEEE').format(date), // Get the day of the week
      ));
    }
   // setState(() {}); // Refresh the UI
  
  @override
  void initState() {
    super.initState();
   // updateHeaders(); // Initialize headers
  }
     List<Item> _items = [
    Item(id: 1, title: 'January'),
    Item(id: 2, title: 'February'),
    Item(id: 3, title: 'March'),
    Item(id: 4, title: 'April'),
    Item(id: 5, title: 'May'),
    Item(id: 6, title: 'June'),
    Item(id: 7, title: 'July'),
    Item(id: 8, title: 'August'),
    Item(id: 9, title: 'September'),
    Item(id: 10, title: 'October'),
    Item(id: 11, title: 'November'),
    Item(id: 12, title: 'December'),
  ];

      



    return Scaffold(
      backgroundColor:back ,
      appBar: AppBar(
        title: Text('Planner'),
        
      ),
      body: 
          Column(
  children: [
     DropdownButtonFormField2<int>(
      value: selectedMonth,
      decoration: const InputDecoration(
        labelText: 'Select items',
        border: OutlineInputBorder(),
      ),
      hint: Text('Select items'),
      onChanged: (value) {
           setState(() {
              selectedMonth = value !;
             //   updateHeaders(); 
               // Set selected month
            });
      },
      items: _items
          .map((item) => DropdownMenuItem<int>(
                value: item.id,
                child: Text(item.title),
              ))
          .toList(),
    ),
      
    // Horizontal ListView for headers
    Container(
      height: 60, // Set a fixed height for the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: headers.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedDayIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedDayIndex == index ? b : Color.fromARGB(166, 139, 136, 136),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "${headers[index].date}",
                      style: TextStyle(
                        color: selectedDayIndex == index ? Colors.white : null,
                      ),
                    ),
                  ),
                ),
              
              SizedBox(width: 15),
            ],
          );
        },
      ),
    ),
    Divider(color: Colors.grey),
    
    // Conditional ListView for tasks
    Expanded( // Wrap the ListView in an Expanded widget to take up remaining space
      child: selectedDayIndex != null
          ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(labelText: 'Add Task'),
                                onSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    addTask(selectedDayIndex!, value);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: tasks[selectedDayIndex!]?.length ?? 0,
                          itemBuilder: (context, taskIndex) {
                             return Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
                               child: Container(height: 100,decoration: BoxDecoration(color: a,borderRadius: BorderRadius.circular(10)),child:Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(tasks[selectedDayIndex!]![taskIndex]),
                               ) ,),
                             );
                             //ListTile(
                            //   title: Text(tasks[selectedDayIndex!]![taskIndex]),
                            // );
                          },
                        ),
                      ),
                    ],
                  )
          // ListView.builder(
          //     itemCount: tasks[selectedDayIndex!]?.length ?? 0,
          //     itemBuilder: (context, taskIndex) {
          //       return ListTile(
          //         title: Text(tasks[selectedDayIndex!]![taskIndex]),
          //       );
          //     },
          //   )
          : Center(child: Text('Select a day to see tasks')),
    ),
  ],
),

       
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     // Days List
      //     Expanded(
          
      //       child: 
      //     ),
      //     Tasks List
      //     Expanded(
      //       flex: 2,
      //       child: selectedDayIndex != null
      //           ? 
      //           Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: TextField(
      //                           decoration: InputDecoration(labelText: 'Add Task'),
      //                           onSubmitted: (value) {
      //                             if (value.isNotEmpty) {
      //                               addTask(selectedDayIndex!, value);
      //                             }
      //                           },
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: ListView.builder(
      //                     itemCount: tasks[selectedDayIndex!]?.length ?? 0,
      //                     itemBuilder: (context, taskIndex) {
      //                       return ListTile(
      //                         title: Text(tasks[selectedDayIndex!]![taskIndex]),
      //                       );
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             )
      //           : Center(child: Text('Select a day to see tasks')),
      //     ),
      //   ],
      // ),
    );
  }
}
