import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcon extends StatefulWidget {
  late IconData icon;
  late VoidCallback callback;
  late Color color;

  AppIcon(
      {required IconData icon,
      required VoidCallback callback,
      Color color = Colors.black}) {
    this.icon = icon;
    this.callback = callback;
    this.color = color;
  }

  @override
  State<AppIcon> createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ],
          color: Colors.white,
        ),
        child: Center(
            child: IconButton(
                onPressed: widget.callback,
                icon: Icon(
                  widget.icon,
                  size: 15,
                  color: widget.color,
                ))),
      ),
    );
  }
}
