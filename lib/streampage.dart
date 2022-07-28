import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamBuilder"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(vertical: 80),
        child: const Text(
          " Yet to be Done Developed ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.orange, fontSize: 43.0),
        ),
      ),
    );
  }
}
