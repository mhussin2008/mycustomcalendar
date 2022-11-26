import 'package:flutter/material.dart';
import 'constants.dart';

class SingleDay extends StatelessWidget {
  const SingleDay(this.num,this.state,{Key? key}) : super(key: key);
  final String num;
  final String state;

  @override
  Widget build(BuildContext context) {
    final  pos=Constants.states.indexWhere((element) => element==state);
    return Stack(
      alignment: Alignment.center,

      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: IconButton(
            padding: EdgeInsets.all(0.0)
            ,
             alignment: Alignment.center
            ,
          color: Constants.sColors[pos],
            onPressed: () {
            print(num);
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
