import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget{

  final bool isActive;
  DotIndicator(this.isActive);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1.0
        )

      ),
    );;
  }
}