
import 'package:flutter/material.dart';
import 'kobis_api.dart';
import 'dart:convert';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedDate = "날자를 선택 해주세요";
  var a = MovieApi();

  void getMovieRankingByDate(String dt) async {
    var lists = await a.search(dt);
    for (var i in lists) {
      print(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    // getMovieRankingByDate("20230607");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.search,
                color: Colors.black12,
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  child: Text(selectedDate,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  width: 2000,
                )
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  selectDate(context);
                },
                child: Text('검색'),
              ),
            ],
          ),
        ),
        // title: Text("날짜를 선택 해주세요.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
        body: ElevatedButton(child: Text('search'), onPressed: (){
          getMovieRankingByDate('20230222');
        },),
      ),
    );
  }

  void selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        selectedDate = selected.toString();
      });
    }

    
  }
}
