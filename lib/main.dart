import 'package:flutter/material.dart';
import 'package:futurebuild/second.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NetworkData",
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyBuildState(title: "FutureBuild"),
    );
  }
}

// ignore: must_be_immutable
class MyBuildState extends StatefulWidget {
  MyBuildState({Key? key, required String title}) : super(key: key);
  String? title;

  @override
  State<MyBuildState> createState() => _MyBuildStateState();
}

class _MyBuildStateState extends State<MyBuildState> {
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
                  primary: Colors.purpleAccent,
                  backgroundColor: Colors.yellow // Text Color
                  ),
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SecondScreen())));
              }),
              child: const Text('FutureBuilder'),
            ),
            const SizedBox(
              width: 100,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.purpleAccent,
                  backgroundColor: Colors.yellow // Text Color
                  ),
              onPressed: (() {}),
              child: const Text('StreamBuilder'),
            )
          ],
        ));
  }
}

class DetailPage extends StatelessWidget {
  final User user;
  // ignore: prefer_const_constructors_in_immutables
  DetailPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
    );
  }
}

class User {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  User({this.userId, this.id, this.title, this.completed});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }
}
