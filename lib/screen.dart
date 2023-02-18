import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'game_page.dart';
class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);
  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>game_page()));},);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.pink,
        child: Center(child: Lottie.asset('ani/anime.json',)),
      ),
    );
  }
}
