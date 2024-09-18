import 'package:flutter/material.dart';
import 'package:todo/answer.dart';

class complete extends StatefulWidget {
  const complete({super.key});

  @override
  State<complete> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<complete> {
  Color back = Colors.black;
  Color a = Color.fromARGB(248, 53, 52, 52);
  Color b = Color.fromARGB(255, 255, 94, 0);
  int th = DateTime.now().day; // 1-31
  int tm = DateTime.now().month; // 1-12
  int ty = DateTime.now().year;
  var m;
  var d;
  bool value = true; // 2023
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

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 0.3;
    double h = w * 1.25;
    return Scaffold(
        backgroundColor: back,
        appBar: AppBar(
          backgroundColor: back,
          leading:IconButton(onPressed:(){}, icon: Icon(Icons.bedroom_child_sharp)) ,
          centerTitle: true,
          title:  Expanded(
                             child: Container(
                                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(25) ,color: Color.fromARGB(248, 53, 52, 52),),
                             
                                               child: TextField(
                                                 decoration: InputDecoration(
                                                  // helperText: 'Task',
                                                  //labelText: 'Title',
                                                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                                                   hintText: 'Search your task...',
                                                   hintStyle: TextStyle(fontSize: 17,color: Color.fromARGB(255, 126, 120, 120)),
                                                   border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:BorderSide.none
                             
                                                   ),
                                                 ),
                                               ),
                                ),
                           ),
                           actions: [IconButton(onPressed:(){}, icon: Icon(Icons.bedroom_child_sharp)),],
        ),
      
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Container(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height, // Set minimum height
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                        height: 10,
                      ),
                  
                    
                      Center(
                        child: Text(
                              'Completed Tasks',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                      ),
         SizedBox(
                        height: 15,
                      ),
            
                 
                SingleChildScrollView(
  child: Column(
  children: List.generate(14, (index) {
    return 
    
   
      
       Padding(
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
              color:a,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kalkidan fghklp apso',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '10:00 AM - 11:00 AM',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                     SizedBox(height: 10),
                      Container(
                        width: 60,
                        child: Text('High',
                            style:
                                TextStyle(color: Colors.green, fontSize: 12)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 158, 206, 152),
                          borderRadius: BorderRadius.circular(30),
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
      );
    
  }),
),

)

                 
                 
                ],
              ),
            ),
          ),
        )
        );
  }
}