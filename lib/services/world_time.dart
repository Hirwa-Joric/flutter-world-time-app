import 'package:http/http.dart';
import 'dart:convert';
import 'dart:core';

class WorldTime{
  String Location;
  String time;
  String flag;
  String url;


  Future<void> getTime()  async {
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Africa/Kigali"));
    Map data = jsonDecode(response.body);

    String dateTime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = new.setString();


  }
}