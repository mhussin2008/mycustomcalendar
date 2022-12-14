import 'package:flutter/material.dart';
import 'package:mycustomcalendar/constants.dart';

class SingleDay extends StatefulWidget {
  SingleDay(this.num,this.month,this.cstate,{Key? key}) : super(key: key);
  final String num;
  final String month;
  String cstate;




  @override
  State<SingleDay> createState() => _SingleDayState();
}

class _SingleDayState extends State<SingleDay> {
  @override
  Widget build(BuildContext context) {
    final  pos=Constants.states.indexWhere((element) => element==widget.cstate);
    return GestureDetector(
      onTap: (){

          print(widget.num+'  '+widget.month+'  '+widget.cstate);
          if(widget.cstate=='X')
          {

            setState(() {
              widget.cstate='E';
            });
            Constants.gk_Calendar.currentState?.setState(() {

            });
            print('changedto E');
          }
          else if(widget.cstate=='E')
          {

            setState(() {
              widget.cstate='X';
            });
            Constants.gk_Calendar.currentState?.setState(() {

            });
            print('changed to X');
          }


      },
      child: Stack(
        alignment: Alignment.center,

        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              color:  Constants.sColors[pos]  ,
                  size:45,
                  Icons.circle_outlined),
            ),


          Text(widget.num
                  ,
           style: TextStyle(color:  Constants.sColors[pos]),
              )
        ],

      ),
    );


  }
}
