import 'package:http/http.dart' as http;
import 'dart:convert';

class api {
  Future<void> post(String title, String desc) async {
    await http
        .post(Uri.parse("https://api.nstack.in/v1/todos"),
            headers: {
              'content-type': 'application/json',
            },
            body: jsonEncode(
                {"title": title, "description": desc, "is_completed": false}))
        .then((value) {
      print(value.statusCode);
      print(value.body);
    });
  }
  Future<void> get() async {
    var val=await http.get(Uri.parse("https://api.nstack.in/v1/todos"));
    var data=jsonDecode(val.body);
   var respo=data['items'];
  //  respo.map((e){
  //    print(e['title']);
  //  }).tolist;


    
      
}
}
class Item {
  int id;
  String title;
  Item({required this.id, required this.title});
  
}