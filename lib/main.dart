import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawCanvas(),
    ); 
  }
}

class DrawCanvas extends StatefulWidget {
  const DrawCanvas({super.key});

  @override
  State<DrawCanvas> createState() => _DrawCanvasState();
}

class _DrawCanvasState extends State<DrawCanvas> {

  List<List<Offset>> strokes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, 
                     title: Text("Draw Here", style: TextStyle( color: Color.fromARGB(240, 255, 255, 255) ),),  
                     backgroundColor: Color.fromARGB(255, 15, 15, 15),
                     ),
      body: Container(
        height: 500,
        color:Color.fromARGB(255, 0, 0, 0),
        child: GestureDetector( 
          onPanStart:(details) {
            setState(() {
              strokes.add([]);
            });
          },
          onPanUpdate: (details) {
          setState(() {
            strokes.last.add(details.localPosition,);
          });
        },
        child: CustomPaint(
          painter:
          DrawingPainter(strokes,),
        child: Container(),
        ),
        )
      ),
    
    );
  }
}

class DrawingPainter extends CustomPainter {

  List<List<Offset>> strokes = [];

  DrawingPainter(
    this.strokes,
  );

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    Paint pen = Paint()

    ..color = Colors.white
    ..strokeWidth = 5
    ..strokeCap = StrokeCap.round;

    for(final stroke in strokes) {

  for(int i = 0; i < stroke.length - 1; i++) {

    canvas.drawLine(
      stroke[i],
      stroke[i+1],
      pen,
    );

  }

}

}

  @override
  bool shouldRepaint(oldDelegate,)
  {
    return true;
  }
}