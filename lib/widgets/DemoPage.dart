import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  String? data;

  DemoPage(String? data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data!,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}