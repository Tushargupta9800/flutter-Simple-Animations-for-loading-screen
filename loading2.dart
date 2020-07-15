import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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

class _HomeState extends State<Home> with TickerProviderStateMixin{

  AnimationController animationController;
  AnimationController _controller;
  Animation animation;
  Animation animation1;
  Tween tween;

  createbubble(double begin, double end){
    animation = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(begin,end,curve: Curves.easeIn),
    ));
    animation.addListener(() {setState(() {});});
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    animation1 = ColorTween(begin: Colors.yellowAccent,end: Colors.redAccent).animate(_controller);
    animation1.addListener(() {setState(() {});});
    animation1.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    return Transform.scale(
      scale: animation.value,
      child: Row(
        children: [
        CircleAvatar(
        backgroundColor: animation1.value,
        radius: 8.0,
      ),
        SizedBox(width: 5.0,)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    tween = Tween<double>(begin: 0.0,end: 1.0);
    animationController.forward();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createbubble(0.0,0.2),
            createbubble(0.2,0.4),
            createbubble(0.4,0.6),
            createbubble(0.6,0.8),
            createbubble(0.8,1.0),
          ],
        ),
      ),
    );
  }
}
