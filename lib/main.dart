import 'package:flutter/material.dart';
import 'package:futurebuild/todo_stream_builder.dart';
import 'package:futurebuild/todo_future_builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NetworkData",
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyBuild(title: "FutureBuild"),
    );
  }
}

// ignore: must_be_immutable
class MyBuild extends StatefulWidget {
  MyBuild({Key? key, required String title}) : super(key: key);
  String? title;
  @override
  State<MyBuild> createState() => _MyBuildState();
}

class _MyBuildState extends State<MyBuild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Data')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 500.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.purpleAccent, backgroundColor: Colors.yellow),
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const TodoListScreen())));
              }),
              child: const Text(
                'FutureBuilder',
                style: TextStyle(
                  fontSize: 20.5,
                ),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.purpleAccent,
                  backgroundColor: Colors.yellow // Text Color
                  ),
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const StreamPage())));
              }),
              child: const Text(
                'StreamBuilder',
                style: TextStyle(
                  fontSize: 20.5,
                ),
              ),
            )
          ],
        ));
  }
}
