import 'package:flutter/material.dart';
import 'package:futurebuild/todo_business_logic.dart';
import 'package:futurebuild/todo_detail_screen.dart';
import 'package:futurebuild/todo_list_view.dart';
import 'package:futurebuild/todo_model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);
  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late Future<List<Todo>> futureAlbum;
  Todo_BusinessLogic businessLogic = Todo_BusinessLogic();
  @override
  void initState() {
    super.initState();
    futureAlbum = businessLogic.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              ValueListenableBuilder<bool>(
                valueListenable: businessLogic.isDataload,
                builder: (BuildContext context, bool value, Widget? child) {
                  if (value == true) {
                    return const Icon(Icons.done);
                  } else {
                    return const Icon(
                      Icons.close,
                      color: Colors.white,
                    );
                  }
                },
              ),
            ],
            title: const Text("Result Page")),
        body: FutureBuilder<List<Todo>>(
            future: futureAlbum,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Todo_ListView(
                          title: snapshot.data[index].title,
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TodoDetailPage(
                                        snapshot.data?[index] ?? Todo())));
                          });
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }));
  }
}
