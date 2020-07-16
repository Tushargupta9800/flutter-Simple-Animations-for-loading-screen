import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

AnimationController animationController;
Animation animation;
Tween tween;

class _HomeState extends State<Home> with TickerProviderStateMixin{

  @override
  void initState() {
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
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: CustomPaint(
          painter: iwanttopaint(),
        )
      ),
    );
  }
}

class iwanttopaint extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.08);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.2 + (-130 + animation.value*100), size.width, size.height * 0.08);
    path.lineTo(size.width, 0.0);
    var paint = Paint();
    paint.color = Colors.yellowAccent;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}