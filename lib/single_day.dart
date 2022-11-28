import 'package:flutter/material.dart';
import 'constants.dart';

class SingleDay extends StatelessWidget {
  const SingleDay(this.num,this.month,this.cstate,{Key? key}) : super(key: key);
  final String num;
  final String month;
  final String cstate;

  @override
  Widget build(BuildContext context) {
    final  pos=Constants.states.indexWhere((element) => element==cstate);
    return Stack(
      alignment: Alignment.center,

      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            alignment: Alignment.center,
            color: Constants.sColors[pos],
            onPressed: () {
            print(num+'  '+month+'  '+cstate);
            if(cstate=='X')
            {
              int getindex=Constants.widgetList.indexWhere((element) => (element.num==num && element.month==month));
              //Constants.widgetList[getindex].cstate='E';

              print('changed');
            }

            },
            icon: const Icon(
                size:40,
                Icons.circle_outlined),
          ),
        ),
        Text(num
                ,
         style: TextStyle(color:  Constants.sColors[pos]),
            )
      ],

    );


  }
}
