import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:core';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime()  async {
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Africa/Kigali"));
    Map data = jsonDecode(response.body);

    String dateTime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);


  }

  @override
  void initState() {
    super.initState();
    getTime();

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Location area"),
    );
  }
}
