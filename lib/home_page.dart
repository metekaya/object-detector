import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWorking = false;
  String result = "";
  CameraController? cameraController;
  CameraImage? imgCamera;

  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController!.startImageStream(
          (imagesFromStream) => {
            if (!isWorking)
              {
                isWorking = true,
                imgCamera = imagesFromStream,
              }
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple.shade800,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 5), // changes position of shadow
                      )
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: double.infinity,
                  child: Icon(
                    Icons.camera_outlined,
                    color: Colors.amber,
                    size: 100,
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.pink.shade900),
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {},
                      highlightColor: Colors.amber.shade100,
                      splashColor: Colors.amber.shade200,
                      child: Icon(
                        Icons.camera_alt,
                        size: 75,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
