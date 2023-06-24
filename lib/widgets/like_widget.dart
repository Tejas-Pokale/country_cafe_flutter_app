import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeWidget extends StatefulWidget {
  bool color = true;
  Color c = Colors.black;

  LikeWidget({required bool color}) {
    this.color = color;
    this.c = color ? Colors.black : Colors.pink;
  }

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  late bool color ;
  late Color c;

  @override
  void initState() {
   color = widget.color;
   c = widget.c;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: () {
                if (color) {
                  color = false;
                  c = Colors.pink;
                } else {
                  color = true;
                  c = Colors.black;
                }
                print('color changed $color');
                setState(() {});
              },
              icon: Icon(
                FontAwesomeIcons.solidHeart,
                color: c,
                size: 15,
              ))),
    );
  }
}
