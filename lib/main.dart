import 'package:flutter/material.dart';
import 'package:object_detection_app/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Object Detection',
      home: SplashScreen(),
    );
  }
}
