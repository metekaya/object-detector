import 'package:flutter/material.dart';
import 'package:object_detection_app/about.dart';
import 'package:object_detection_app/camera_page.dart';
import 'package:camera/camera.dart';
import 'package:object_detection_app/home_page.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      title: 'Object Detection',
      home: AboutPage(),
      routes: {
        CameraPage.routeName: (ctx) => CameraPage(),
        AboutPage.routeName: (ctx) => AboutPage(),
      },
    );
  }
}
