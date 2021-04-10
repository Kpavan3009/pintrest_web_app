import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/gestures/events.dart';
import 'main.dart';
// ignore: must_be_immutable

class ActionButton extends StatefulWidget {
  ActionButton({Key key, this.iconData}) : super(key: key);
  final IconData iconData;
  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(

      child: FloatingActionButton(
        onPressed: (){
        },
        elevation: 0,
        hoverColor: Colors.black12,
        backgroundColor: Colors.white,
        hoverElevation: 0,
        child: Icon(widget.iconData,color: Colors.black26,),
      ),
    );
  }

}
