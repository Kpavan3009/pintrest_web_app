import 'package:flutter/material.dart';
import 'package:pinterest_web/widgets.dart';
import 'package:flutter/src/gestures/events.dart';
import 'image_data.dart';
import 'widgets.dart' as widg;
import 'showData.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pintrest Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {
  Color color;
  void _mouseEnter(PointerEnterEvent event) {
    setState(() {
      color=Colors.black12;
    });
  }
  void _mouseLeave(PointerEvent event) {
    setState(() {
      color=Colors.white;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 10,top: 10),
          child: MouseRegion(
            child: FloatingActionButton(
              onPressed: (){
              },
              backgroundColor: color,
              elevation: 0,
              hoverElevation: 0,
              child: Image(image: AssetImage('images/logo.png',
              ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        actions: [
          ActionButton(iconData: Icons.add_alert_rounded),
          ActionButton(iconData: Icons.message),
        ],
        title: MouseRegion(
          onEnter: _mouseEnter,
          onExit: _mouseLeave,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color,
            ),
            margin: const EdgeInsets.only(top: 8),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 17
                ),
                border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30.0)),
                  fillColor: Colors.red

              ),
            ),
          ),
        ),
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 4 ,
        children: imageData.map((e) => ImageShow(
            e.url
        )).toList(),
      ),
    );
  }
}


