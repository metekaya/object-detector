import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'main.dart';

class CameraPage extends StatefulWidget {
  static const routeName = '/CameraPage';
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isWorking = false;
  String result = "";
  CameraController? cameraController;
  CameraImage? imgCamera;

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/tflite/mobilenet_v1_1.0_224.tflite',
      labels: 'assets/tflite/mobilenet_v1_1.0_224.txt',
    );
  }

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
                runModelFromStreamFrames(),
              }
          },
        );
      });
    });
  }

  runModelFromStreamFrames() async {
    if (imgCamera != null) {
      var recognitions = await Tflite.runModelOnFrame(
        bytesList: imgCamera!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: imgCamera!.height,
        imageWidth: imgCamera!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      result = "";

      recognitions!.forEach((response) {
        result += response["label"] +
            "  " +
            (response["confidence"] as double).toStringAsFixed(2) +
            "\n\n";
        log(result);
      });

      setState(() {
        result;
      });

      isWorking = false;
    }
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() async {
    super.dispose();
    await Tflite.close();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade800,
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
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        initCamera();
                      },
                      borderRadius: BorderRadius.circular(18),
                      highlightColor: Colors.amber.shade100,
                      splashColor: Colors.amber.shade200,
                      child: imgCamera == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 75,
                                  color: Colors.amber,
                                ),
                                Text(
                                  'Kamerayı açmak için tıklayın',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontFamily: 'Raleway',
                                  ),
                                )
                              ],
                            )
                          : AspectRatio(
                              aspectRatio: cameraController!.value.aspectRatio,
                              child: CameraPreview(cameraController!),
                            ),
                    ),
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
                      color: Colors.amber.shade600),
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                    child: Text(
                      result,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Raleway',
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
