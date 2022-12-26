//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mycustomcalendar/single_day.dart';
import 'package:quiver/time.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../mycalendar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // void  Update (){
  //  setState(() {
  //   build(context);
  //  });
  // }
  @override
  void initState() {
    for(int h=1;h<Constants.dayApprev.length;h++){
      Constants.header.add(
         SingleDay(Constants.dayApprev[h], 0.toString(), 'H'));
    }
    //Constants.header.removeAt(0);



    for(int m=1;m<=12;m++) {
      for (int i = 1; i <= daysInMonth(2022, m); i++)
        {Constants.widgetList.add(
            SingleDay(i.toString(), m.toString(), 'E'));}
    }
    // Constants.widgetList.add(
    //     SingleDay(31.toString(), 12.toString(), 12.isEven? 'X':'E'));
    for(int i=1;i<=7;i++) {
      Constants.widgetList.add(SingleDay('0', '0', 'Z'));
    }
    print('widget list length='+Constants.widgetList.length.toString());

    Constants.widgetList.removeAt(0);


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () async {
          // get data from  prefs to Screen
          List<String> savedgetlist;
          savedgetlist = await _prefs.then((SharedPreferences prefs) {
            return prefs.getStringList('data')?? ['0'];});
          print(savedgetlist);

          setState(() {

            Constants().scheduleToMem(savedgetlist);
          });
        },
          icon: const Icon(Icons.download),

        ),
        actions: [

          IconButton(onPressed: () async {
            // get data from  prefs to Screen
            List<String> getlist;

            getlist =Constants().scheduleFromMem();

            final SharedPreferences prefs = await _prefs;
            prefs.setStringList('data', getlist);
            print('saved to sharedprefs');
            print(getlist);
            setState(() {

              //Constants().scheduleToMem(savedgetlist);
            });
          },
            icon: const Icon(Icons.save),

          ),

        ],
      ),
      backgroundColor: Colors.white,
      
      body: SafeArea(child: MyCalendar(key: Constants.gk_Calendar)),
    );
  }
}