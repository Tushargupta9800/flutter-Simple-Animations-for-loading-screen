import 'package:flutter/material.dart';

class loading7 extends StatefulWidget {
  Color BackColor;
  Color CircleColor;

  loading7({Key key,
    @required this.BackColor,
    @required this.CircleColor,
  }):super(key: key);

  @override
  _loading7State createState() => _loading7State();
}

AnimationController animationController;
Animation animation;
Tween tween;
Color fill;
Color fill2;
var stroke;
var midwidth;
var midheight;

class _loading7State extends State<loading7> with TickerProviderStateMixin{

  getmidpoint(){
    midwidth = MediaQuery.of(context).size.width*0.5;
    midheight = MediaQuery.of(context).size.height*0.5;
    return Container();
  }

  @override
  void initState() {
    fill = widget.BackColor;
    fill2 = widget.CircleColor;
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
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
    return Center(
        child: CustomPaint(
          painter: iwanttopaint(),
          child: getmidpoint(),
        )
    );
  }
}

class iwanttopaint extends CustomPainter{
  var anim = animation.value*30;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = fill;
    var path = Path();
    path.moveTo(midwidth - 30 + animation.value*30, midheight - 30);
    path.quadraticBezierTo(midwidth, midheight - 30 - (1 - animation.value)*30, midwidth + 30 - animation.value*30, midheight - 30);
    path.lineTo(midwidth + animation.value*30, midheight + 30);
    path.quadraticBezierTo(midwidth, midheight + 30 + animation.value*30, midwidth - animation.value*30, midheight + 30);
    canvas.drawPath(path, paint);
    var paint2 = Paint()
      ..color = fill2;
    canvas.drawCircle(Offset(midwidth,midheight - 35 + animation.value*70), 10, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
