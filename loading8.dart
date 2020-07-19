import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class loading8 extends StatefulWidget {

  Color color1,color2,color3,color4;
  Offset pos;
  int Chooseoutof4;

  loading8({Key key,
    @required this.color1,
    @required this.color2,
    @required this.color3,
    @required this.color4,
    @required this.Chooseoutof4,
    @required this.pos,
  })
      :super(key: key);

  @override
  _loading8State createState() => _loading8State();
}

AnimationController animationController;
Animation animation;
Tween tween;
List<Color> fill = List();
int choice;
Offset position;

class _loading8State extends State<loading8> with TickerProviderStateMixin{

  @override
  void initState() {
    position = widget.pos;
    choice = widget.Chooseoutof4;
    fill.add(widget.color1);
    fill.add(widget.color2);
    fill.add(widget.color3);
    fill.add(widget.color4);
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
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
      ),
    );
  }
}

class iwanttopaint extends CustomPainter{
  double height = 30;
  double animationtill1;
  double animationtill2;

  @override
  void paint(Canvas canvas, Size size) {
    if(choice <=1){
      animationtill1 = animation.value * 25; animationtill2 = animation.value * 25;
    }else if(choice == 2){
      animationtill1 = animation.value * 25; animationtill2 = (1 - animation.value) * 25;
    }

    for(int i=0;i<4;i++){
      if(choice == 3 && (i == 1 || i == 3)){
        animationtill1 = (1 - animation.value) * 25; animationtill2 = (1 - animation.value) * 25;
      }else if(choice == 3){
        animationtill1 = animation.value * 25; animationtill2 = animation.value * 25;
      }
      if(choice >= 4){
        height = 35;
        if(i == 0 || i == 3) {
          animationtill1 = (animation.value) * 35; animationtill2 = (animation.value) * 35;
        }else if(i == 1 || i == 2) {
          animationtill1 = (1.5 - animation.value) * 35; animationtill2 = (1.5 - animation.value) * 35;
        }
      }
      var path = Path();
      var paint = Paint()
              ..color = fill[i];
      path.moveTo(position.dx - 35 + 20*i, position.dy - height + animationtill1);
      path.lineTo(position.dx - 25 + 20*i, position.dy - height + animationtill2);
      path.lineTo(position.dx - 25 + 20*i, position.dy + height - animationtill1);
      path.lineTo(position.dx - 35 + 20*i, position.dy + height - animationtill2);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}