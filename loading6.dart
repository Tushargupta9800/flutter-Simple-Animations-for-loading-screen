import 'package:flutter/material.dart';

class loading6 extends StatefulWidget {
  Offset pos;
  double radius;
  Color color;
  double jump;
  double StrokeWidth;

  loading6({Key key,
    @required this.pos,
    @required this.radius,
    @required this.color,
    @required this.jump,
    @required this.StrokeWidth,
  }):super(key: key);

  @override
  _loading6State createState() => _loading6State();
}

AnimationController animationController;
Animation animation;
Tween tween;
Offset POS;
var radii;
Color fill;
var high;
var stroke;

class _loading6State extends State<loading6> with TickerProviderStateMixin{

  @override
  void initState() {
    POS = widget.pos;
    radii = widget.radius;
    fill = widget.color;
    high = widget.jump;
    stroke = widget.StrokeWidth;
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
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
          painter: iwanttopaint(),
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
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = stroke;
    canvas.drawCircle(Offset(POS.dx,POS.dy + animation.value*high - high*0.5), radii, paint);
    canvas.drawCircle(Offset(POS.dx,POS.dy), radii, paint);
    canvas.drawCircle(Offset(POS.dx,POS.dy + (1-animation.value)*high - high*0.5), radii, paint);
    canvas.drawCircle(Offset(POS.dx + animation.value*high - high*0.5,POS.dy), radii, paint);
    canvas.drawCircle(Offset(POS.dx + (1-animation.value)*high - high*0.5,POS.dy), radii, paint);
    canvas.drawCircle(Offset(POS.dx + (1-animation.value)*high - high*0.5,POS.dy + (1-animation.value)*high - high*0.5), radii, paint);
    canvas.drawCircle(Offset(POS.dx + animation.value*high - high*0.5,POS.dy + (1-animation.value)*high - high*0.5), radii, paint);
    canvas.drawCircle(Offset(POS.dx + (1-animation.value)*high - high*0.5,POS.dy + animation.value*high - high*0.5), radii, paint);
    canvas.drawCircle(Offset(POS.dx + animation.value*high - high*0.5,POS.dy + animation.value*high - high*0.5), radii, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}