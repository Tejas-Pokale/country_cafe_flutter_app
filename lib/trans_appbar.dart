import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TransApp extends StatefulWidget {
  const TransApp({super.key});

  @override
  State<TransApp> createState() => _TransAppState();
}

class _TransAppState extends State<TransApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Country Cafe'),
        centerTitle: true,
        leading: BackButton(),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.search))
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
        ),
        backgroundColor: Colors.white.withOpacity(0.3),
        elevation: 0,
      ),
      body: Image.asset('assets/images/cafe.jpg',fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
    );
  }
}