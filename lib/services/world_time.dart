import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location  ;
  var time ;
  String flag ;
  String url;
  bool isDayTime = false ;

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    /*Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);*/
    //Make request
    try{
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/${url}'));
      Map data = jsonDecode(response.body);

      //get data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now)
      time = DateFormat.jm().format(now);
      print("time in world_time: ${time}");
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch(e){
      print("caught error: ${e}");
      time = "Could not get time data";
    }
  }
}