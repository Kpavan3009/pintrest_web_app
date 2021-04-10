import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'image_data.dart';
class ImageShow extends StatefulWidget {
  final String url1;
  ImageShow(this.url1);

  @override
  _ImageShowState createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
   double pacity = 1.0;
  Color color;
   bool viewVisible = false ;
   void showWidget(){
     setState(() {
       viewVisible = true ;
     });
   }

   void hideWidget(){
     setState(() {
       viewVisible = false ;
     });
   }
  void _mouseEnter(PointerEnterEvent event) {
    setState(() {
      pacity= 0.50;
      showWidget();
      //color=Colors.black87;
    });
  }
  void _mouseLeave(PointerEvent event) {
    setState(() {
      pacity= 1;
      hideWidget();
      //color =Colors.red;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _mouseEnter,
      onExit: _mouseLeave,
        child: Container(

          child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 350,
                  height: 250,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Opacity(
                        opacity: pacity,
                        child: Image(
                          image: NetworkImage(widget.url1),
                          fit: BoxFit.cover,
                          color: color,
                        ),
                      )
                  ),
                ),
                Positioned(
                  top: 170,
                    left: 40,
                      child: Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: viewVisible,
                        child: Container(
                          width: 260,
                          height: 60,
                            child: Card(
                                child: Row(
                                  children: [
                                    SizedBox(width: 15,),
                                    IconButton(icon: Icon(Icons.download_sharp,), onPressed: (){},hoverColor: Colors.black12,),
                                    SizedBox(width: 20),
                                    IconButton(icon: Icon(Icons.link,), onPressed: (){},hoverColor: Colors.black12,),
                                    SizedBox(width: 20),
                                    IconButton(icon: Icon(Icons.share,), onPressed: (){},hoverColor: Colors.black12,),
                                    SizedBox(width: 20),
                                    FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      onPressed: (){},
                                      hoverElevation: 0,
                                      hoverColor: Colors.black12,
                                      child: Image(image: AssetImage('images/dot.png'),
                                        width: 30,

                                      ),
                                    )
                                  ],
                            ),
                          ),
                    ),
                      ))
              ]
          ),
        ),
    );
  }
}
