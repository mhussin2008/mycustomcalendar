import 'package:flutter/material.dart';
import 'package:mycustomcalendar/single_day.dart';


class Constants
{
  static const dayName=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  static const dayApprev=['St','Sn','Mn','Tu','Wd','Th','Fr'];
  static const states=['N','D','X','E','H'];
  static const sColors=[Colors.red,Colors.green,Colors.blue,Colors.white,Colors.blueGrey];
  static List<List<SingleDay>> widgetList= List.generate(5, (i) => List.filled(7, const SingleDay('31', 'X'),growable: false),growable: false);

}
