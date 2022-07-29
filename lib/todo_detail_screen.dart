import 'package:flutter/material.dart';
import 'package:futurebuild/todo_model.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo todo;
  // ignore: prefer_const_constructors_in_immutables
  TodoDetailPage(this.todo, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Of the Candiate"),
      ),
    );
  }
}
