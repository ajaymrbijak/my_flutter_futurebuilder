// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:futurebuild/todo_list_view.dart';
import 'package:futurebuild/todo_business_logic.dart';
import 'package:futurebuild/todo_detail_screen.dart';
import 'package:futurebuild/todo_model.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);
  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  Todo_BusinessLogic businessLogic = Todo_BusinessLogic();
  @override
  void initState() {
    // ignore: avoid_print
    print("initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    businessLogic.streamBuilderData();
    return Scaffold(
        appBar: AppBar(
          title: const Text("StreamBuilder"),
        ),
        body: StreamBuilder(
          stream: businessLogic.streamController.stream,
          //  initialData: [todo],
          builder: ((context, AsyncSnapshot<List<Todo>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return const Text("Please Connect to internet ");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                padding: const EdgeInsets.all(43),
                margin: const EdgeInsets.fromLTRB(44, 54, 43, 5),
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Todo_ListView(
                          title: "${snapshot.data?[index].title}",
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TodoDetailPage(
                                        snapshot.data?[index] ?? Todo())));
                          });
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
            }
            return const Text('Something Went Wrong');
          }),
        ));
  }
}
