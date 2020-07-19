////////////////////////////////////////////////////////////
///                 - Tushar Gupta                       ///
////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'loading.dart';
import 'loading1.dart';
import 'loading2.dart';
import 'loading3.dart';
import 'loading4.dart';
import 'loading5.dart';
import 'loading6.dart';
import 'loading7.dart';
import 'loading8.dart';

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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          loading1(color: Colors.redAccent,),
          loading2(fromcolor: Colors.yellowAccent, tocolor: Colors.redAccent),
          loading3(color: Colors.redAccent),
          loading4(color: Colors.yellowAccent),
          loading5(xpos: 200, ypos: 450, color: Colors.grey),
          loading7(BackColor: Colors.white, CircleColor: Colors.black,),
          loading8(color1: Colors.teal,
                        color2: Colors.yellowAccent,
                        color3: Colors.red,
                        color4: Colors.black,
                        Chooseoutof4: 3,
                        pos: Offset(MediaQuery.of(context).size.width*0.5,MediaQuery.of(context).size.height*0.5),
                      ),
        ],
      ),
    );
  }
}
