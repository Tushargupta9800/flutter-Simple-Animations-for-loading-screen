# flutter-Simple-Animations-for-loading-screen
Simple pages which uses animation and custom painter<br/>
Total 8 loading screens are updated in this repo<br/>
The main motive of this repository for me is to learn flutter animation and custom painting better.
<br/> If you see anything wrong with any code then do not hesitate to raise the issue. 😊😊


# screenshots
|Sr. No. |GIF |Code| function to use this loading|
:----------:|:-----------:|:-------------:|:------------:
loading1 |<img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading1.gif" height="350em" />|[code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading1.dart) | loading1(color: Colors.green,),
| loading2 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading2.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading2.dart) |  loading2(fromcolor: Colors.yellowAccent, <br/>tocolor: Colors.redAccent),
| loading3 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading3.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading3.dart) | loading3(color: Colors.yellowAccent, child: Container(),
| loading4 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading4.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading4.dart) | loading4(color: Colors.yellowAccent),
| loading5 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading5.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading5.dart) | loading5(xpos: MediaQuery.of(context).size.width * 0.5,<br/> ypos: MediaQuery.of(context).size.height * 0.5, color: Colors.yellowAccent),
| loading6 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading6i.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading6.dart) | loading6(pos: Offset(MediaQuery.of(context).size.width * 0.5,<br/>MediaQuery.of(context).size.height * 0.5), <br/>radius: 3.0,<br/> color: Colors.redAccent,<br/> jump: 50.0, <br/>StrokeWidth: 6.0),
| loading6 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading6ii.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading6.dart) | loading6(pos: Offset(MediaQuery.of(context).size.width * 0.5,<br/>MediaQuery.of(context).size.height * 0.5), <br/>radius: 0.0,<br/> color: Colors.redAccent,<br/> jump: 50.0, <br/>StrokeWidth: 10.0),
| loading7 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading7.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading7.dart) | loading7(BackColor: Colors.white, CircleColor: Colors.black,),
| loading8 | <img src="https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/screenshot/loading8.gif" height="350em" /> | [code](https://github.com/Tushargupta9800/flutter-Simple-Animations-for-loading-screen/blob/master/loading8.dart) | loading8(color1: Colors.teal,<br/>color2: Colors.yellowAccent,<br/>color3: Colors.red,<br/>color4: Colors.black,<br/>Chooseoutof4: 3,<br/>pos: Offset(MediaQuery.of(context).size.width*0.5,<br/>MediaQuery.of(context).size.height*0.5),<br/>),

### Note:- Actual animation is far better then above GIFs.

## more cool stuff to come soon so keep a watch on this repo.

# How to use these loadings?
1) Clone and star this repo.
2) Create a new flutter project.
3) Add the loading(i).dart file(whichever you like out of them) in your project.
4) import the loading(i).dart file in your main.dart file.
5) call the function loading(i) as stated in the table above. (still confused?? see main.dart file)
6) That's it enjoy the loadings.
