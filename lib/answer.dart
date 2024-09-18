import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:todo/module/api.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  Color a = Color.fromARGB(248, 53, 52, 52);
  Color b = Color.fromARGB(255, 255, 94, 0);
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController Praiority = TextEditingController();

   api el=api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'New Task',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz_outlined,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(248, 53, 52, 52),
                ),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    // helperText: 'Task',
                    //labelText: 'Title',
                    hintText: 'Enter Task Name',
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 126, 120, 120)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(248, 53, 52, 52),
                ),
                child: TextField(
                  controller: description,
                  decoration: InputDecoration(
                    // helperText: ,
                    hintMaxLines: 6,

                    hintText:
                        'Enter Task Name sfdghfjgkiolfokdijjjjjjjjjjijrheygwfgdgfhdddddddddddhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhherjhegwfsgdhfjgfhdgsfgdhfjgfhdgsfagshdjfhdgsfgdhfjg',
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 126, 120, 120)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Date',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(248, 53, 52, 52),
                ),
                child: TextField(
                  controller: date,
                  decoration: InputDecoration(
                    // helperText: 'Task',
                    //labelText: 'Title',
                    hintText: '22 May',
                    suffixIcon: Icon(
                      Icons.punch_clock,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 126, 120, 120)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Due Time',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(248, 53, 52, 52),
                        ),
                        child: TextField(
                          controller: time,
                          decoration: InputDecoration(
                            // helperText: 'Task',
                            //labelText: 'Title',
                            hintText: '22 May',
                            suffixIcon: Icon(
                              Icons.punch_clock,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 126, 120, 120)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'End Time',
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     SizedBox(
                  //       height: 6,
                  //     ),
                  //     Container(
                  //       width: 230,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         color: Color.fromARGB(248, 53, 52, 52),
                  //       ),
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //           // helperText: 'Task',
                  //           //labelText: 'Title',
                  //           hintText: '22 May',
                  //           suffixIcon: Icon(
                  //             Icons.timelapse,
                  //             color: Colors.white,
                  //           ),
                  //           hintStyle: TextStyle(
                  //               fontSize: 15,
                  //               color: Color.fromARGB(255, 126, 120, 120)),
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(25),
                  //               borderSide: BorderSide.none),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Praiority',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(248, 53, 52, 52),
                ),
                child: TextField(
                  controller: Praiority,
                  decoration: InputDecoration(
                    // helperText: 'Task',
                    //labelText: 'Title',
                    hintText: 'Hard',
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 126, 120, 120)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
          el.post(title.text, description.text);
             ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item created successfully')),
        );
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: Container(
              height: 50,
              width: 400,
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 255, 94, 0)),
            ),
          )),
    );
  }
}
