import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  final xcor;
  final ycor;

  loading({Key key,@required this.xcor,@required this.ycor}):super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

AnimationController animationController;
Animation animation;
Tween tween;
var Width;
var Height;

class _loadingState extends State<loading> with TickerProviderStateMixin{

  @override
  void initState() {
    Width = widget.xcor;
    Height = widget.ycor;
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
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
        color: null,
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

    var path = Path();
    path.moveTo(Width - 30, Height);
    path.quadraticBezierTo(Width - 15, Height  + anim - 15, Width, Height);
    path.quadraticBezierTo(Width + 15, Height  - anim + 15, Width + 30, Height);
    path.quadraticBezierTo(Width + 35, Height + 5, Width + 30, Height + 10);
    path.quadraticBezierTo(Width + 15, Height - anim + 25, Width, Height + 10);
    path.quadraticBezierTo(Width - 15, Height + anim - 5, Width - 30, Height + 10);
    path.quadraticBezierTo(Width - 35, Height + 5, Width - 30, Height);
    var paint = Paint();
    paint.color = Colors.yellowAccent;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}