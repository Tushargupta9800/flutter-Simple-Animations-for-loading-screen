////////////////////////////////////////////////////////////
///                 - Tushar Gupta                       ///
////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';

class loading4 extends StatefulWidget {
  Color color;
  loading4({Key key,@required this.color}):super(key: key);
  @override
  _loading4State createState() => _loading4State();
}

var Screenwidth;
var height;
Color fill;
AnimationController animationController;
Animation animation;
Tween tween;

class _loading4State extends State<loading4> with TickerProviderStateMixin{

  Findsize(){
    Screenwidth = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container();
  }

  @override
  void initState() {
    fill = widget.color;
    super.initState();
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
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: Findsize(),
        painter: iwanttopaint(),
      )
    );
  }
}

class iwanttopaint extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, height);
    path.lineTo(0, height * 0.92);
    path.quadraticBezierTo(Screenwidth * 0.25, height - (1 - animation.value)*(Screenwidth * 0.25), Screenwidth * 0.5, height * 0.92);
    path.quadraticBezierTo(Screenwidth * 0.75, height  - animation.value*(Screenwidth * 0.25), Screenwidth , height * 0.92);
    path.lineTo(Screenwidth, height);
    var paint = Paint();
    paint.color = fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
