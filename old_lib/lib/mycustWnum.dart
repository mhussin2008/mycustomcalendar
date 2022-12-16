import 'package:flutter/material.dart';

import 'mycust_num.dart';

class mycust_Wnum extends StatelessWidget {
  String num='0';
  String state='H';

  //MyCustNum(this.num,this.state);
   mycust_Wnum(this.num,this.state,{Key? key}) : super(key: key);

  String get getnum {
    return num;
  }

  // Creating the setter method
  // to set the input in Field/Property
  set setnum (String num) {
    this.num = num;
  }

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

