import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo/answer.dart';
import 'package:todo/bottom/home.dart';
import 'package:todo/complete.dart';
import 'package:todo/future.dart';
import 'package:todo/time_planner/new_planne.dart';


import 'package:todo/time_planner/planner.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home()
      
      // TimePlanner(
      //   startHour: 0,
      //   endHour: 23,
      //   use24HourFormat: true,
      //   currentTimeAnimation: true,
      //   setTimeOnAxis: true,
      //   style: TimePlannerStyle(
      //       cellHeight: 50,
      //       cellWidth: 1000,
      //       dividerColor: Colors.grey,
      //       backgroundColor: Colors.white,
      //       interstitialOddColor: Colors.blue,
      //       interstitialEvenColor: Colors.deepOrange,
      //       showScrollBar: true,
      //       horizontalTaskPadding: 10.0,
      //       borderRadius: BorderRadius.all(Radius.circular(8.0))),
      //   tasks: [],
      //   headers: [TimePlannerTitle(title: 'skill', date:"28/4/2024" , titleStyle: const TextStyle(color: Colors.black), dateStyle: TextStyle(color: Colors.black))],
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color back = Colors.black;
  Color a = Color.fromARGB(248, 53, 52, 52);
  Color b = Color.fromARGB(255, 255, 94, 0);
  int th = DateTime.now().day; // 1-31
  int tm = DateTime.now().month; // 1-12
  int ty = DateTime.now().year;
  var m;
  var d;
  bool value = false; // 2023
  String da() {
    if (tm == 1) {
      m == 'Jan';
    } else if (tm == 2) {
      m = 'Feb';
    } else if (tm == 3) {
      m = 'Mar';
    } else if (tm == 4) {
      m = 'Apr';
    } else if (tm == 5) {
      m = 'may';
    } else if (tm == 6) {
      m = 'Jun';
    } else if (tm == 7) {
      m = 'Jul';
    } else if (tm == 8) {
      m = 'Aug';
    } else if (tm == 9) {
      m = 'Sep';
    } else if (tm == 10) {
      m = 'Oct';
    } else if (tm == 11) {
      m = 'Nov';
    } else if (tm == 12) {
      m = 'Dec';
    }
    if (th < 10) {
      d = '0$th';
    } else {
      d = '$th';
    }

    return '$m $d,$ty';
  }

  Future<dynamic> get() async {
    var val = await http.get(Uri.parse("https://api.nstack.in/v1/todos"));
    var data = jsonDecode(val.body);
    var respo = data['items'];
    //  respo.map((e){
    //    print(e['title']);
    //  }).tolist;
    return respo;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 0.3;
    double h = w * 1.25;
    return Scaffold(
        backgroundColor: back,
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
          child: Container(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height, // Set minimum height
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hey Kalkidan',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            da(),
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ),
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(248, 53, 52, 52),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        // helperText: 'Task',
                        //labelText: 'Title',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: 'Search your task...',
                        hintStyle: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 126, 120, 120)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: w * 1.25,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white
                                    .withOpacity(0.4), // Shadow color
                                offset: Offset(
                                    0, 4), // Horizontal and vertical offset
                                blurRadius:
                                    8, // How much the shadow should be blurred
                                spreadRadius:
                                    2, // How much the shadow should spread
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(
                                    0.1), // A lighter shadow for depth
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                spreadRadius: 0,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => complete()));
                              },
                              child: Container(
                                height: h * 0.46,
                                child: Center(
                                  child: Text(
                                    "Complete",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: b,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => futur()));
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Planned",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                height: h * 0.46,
                                decoration: BoxDecoration(
                                    color: a,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ), 
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Todays Task',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => futur()));
                        },
                        child: Text(
                          'see all',
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  SingleChildScrollView(
                    child: FutureBuilder(
                        future: get(),
                        builder: (context, AsyncSnapshot snapshot) {
                          var docs = snapshot.data;
                          return Column(
                            children: List.generate(docs.length, (index) {
                              var doc = docs[index];
                              return Dismissible(
                                key: Key('$index'), // Unique key for each item
                                direction: DismissDirection
                                    .endToStart, // Swipe from right to left
                                background: Container(
                                  color: Colors
                                      .red, // Background color when swiped
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(Icons.delete,
                                      color: Colors
                                          .white), // Icon for delete action
                                ),
                                onDismissed: (direction) {
                                  // Handle the deletion logic here
                                  // For example, you could remove the item from the data source
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Item deleted')),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => form(),
                                          ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 227, 228, 230),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  doc['title'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  doc['created_at'],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 60,
                                                  child: Text('High',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 12)),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 158, 206, 152),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Checkbox(
                                              shape: CircleBorder(),
                                              activeColor: Colors.black,
                                              checkColor: Colors.white,
                                              value: value,
                                              onChanged: (value) {
                                                setState(() {
                                                  this.value = value!;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
