import 'dart:async';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:country_cafe/main.dart';
import 'package:country_cafe/styles/text_styles.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class country_cafe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return country_cafe_Page();
  }
}

class country_cafe_Page extends State<country_cafe> {
  double _opacity = 0.0;

  final colorizeColors = [
    Colors.black,
    Colors.white,
    Colors.brown,
  ];

  final colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      _opacity = 1.0;
      setState(() {});
    });

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 78, 164, 235),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Blur(
                child: Hero(
                  tag: 'hero',
                  child: Image.asset(
                    'assets/images/bg3.gif',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                blur: 1,
                blurColor: Colors.brown.shade100,
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Text(
                  'Country Cafe`',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
