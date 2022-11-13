import 'package:flutter/material.dart';

import 'mycust_num.dart';

class mycust_Wnum extends StatelessWidget {
  final int num;
  final state;

  //MyCustNum(this.num,this.state);
  const mycust_Wnum(this.num,this.state,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: CustomPaint(
        // size: Size(200,200),
          painter:MyCustNum(num,state) ),
    );
  }
}

