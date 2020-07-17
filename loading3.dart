////////////////////////////////////////////////////////
///               - Tushar Gupta                     ///
////////////////////////////////////////////////////////

import 'package:flutter/material.dart';

class loading3 extends StatefulWidget {
  Color color;
  loading3({Key key,@required this.color}):super(key: key);
  @override
  _loading3State createState() => _loading3State();
}

AnimationController animationController;
Animation animation;
Tween tween;
var height;
var width;
Color fill;

class _loading3State extends State<loading3> with TickerProviderStateMixin{

  findsize(){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container();
  }

  @override
  void initState() {
    super.initState();
    fill = widget.color;
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    tween = Tween<double>(begin: 0.0,end: 1.0);
    animation = tween.animate(animationController);
    animation.addListener(() {setState(() {});});
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: findsize(),
        painter: iwanttopaint(),
      ),
    );
  }
}

class iwanttopaint extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, height * 0.08);
    path.quadraticBezierTo(width * 0.5, height * 0.2 + (-130 + animation.value*100), width, height * 0.08);
    path.lineTo(width, 0.0);
    var paint = Paint();
    paint.color = fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
