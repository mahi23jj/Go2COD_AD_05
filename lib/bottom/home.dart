
import 'package:flutter/material.dart';
import 'package:todo/answer.dart';
import 'package:todo/bottom/navigation.dart';
import 'package:todo/main.dart';
import 'package:todo/time_planner/new_planne.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
     Color c = Color.fromRGBO(102, 102, 101, 1);
     Color back = Colors.black;
      Color a = Color.fromARGB(151, 187, 186, 186).withOpacity(0.5);
  int sel=0;
  void navbar(int index){
    setState(() {
      sel = index;
    });
  }
  //List<coffee> cartItems = [];




  @override
  Widget build(BuildContext context) {
      final List<Widget> page =[
     MyHomePage(),
     form (),
     App()

   
  ];
    return Scaffold(
      backgroundColor: a,
      bottomNavigationBar: nav(onTabChange: (i) => navbar(i)),
      body: page[sel],
    
    );
  }

    
}