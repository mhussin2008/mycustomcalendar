import 'package:flutter/material.dart';
import 'package:flutter_shapes/flutter_shapes.dart';

class MyCustNum extends CustomPainter  {
  //final double pos;
  final int num;
  final state;

  MyCustNum(this.num,this.state);

  @override
  void paint(Canvas canvas, Size size) {
    const States=['N','D','X','E'];
    const sColors=[Colors.red,Colors.green,Colors.blue,Colors.white];
    var pos=States.indexWhere((element) => element==state);
    //print(pos);
    Paint paint1 = Paint()..color =(num==0)? Colors.white:Colors.black;
    //Shapes shapes = Shapes(canvas: canvas, radius: 50, paint: paint1, center: Offset.zero, angle: 0);
    canvas.drawCircle(Offset(0, 0), 20, paint1);
    Paint paint2 =Paint()..color =  (num==0)? Colors.white:sColors[pos];
    canvas.drawCircle(Offset(0, 0), 15, paint2);
    // TextSpan tx=TextSpan(text:'hhhh');
    // TextPainter tp=TextPainter(text: tx);
    //tp.paint(canvas, Offset(10, 10));
    //tp.layout(minWidth: 0,maxWidth: 20);


    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
    final textSpan = TextSpan(
      text: num.toString(),
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
       minWidth: 0,
       maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2-6;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter-14, yCenter-20);
    if(num!=0){textPainter.paint(canvas, offset);}

    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
    //throw UnimplementedError();
  }
}
