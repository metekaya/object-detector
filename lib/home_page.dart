import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 10,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.camera,
          ),
        ),
      ),
    );
  }
}
