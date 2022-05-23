import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(6),
        height: 305,
        width: 305,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber[50],
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/chocolateD.jpg"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
