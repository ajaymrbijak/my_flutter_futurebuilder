import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:futurebuild/todo_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Todo_BusinessLogic {
  StreamController<List<Todo>> streamController = StreamController.broadcast();
  void streamBuilderData() async {
    // ignore: avoid_print
    print("streamBuilderData");
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Todo> posts = body
            .map(
              (dynamic item) => Todo.fromJson(item),
            )
            .toList();
        const duration = Duration(seconds: 1);
        Timer.periodic(duration, (timer) {
          // Stop the timer when it matches a condition
          if (timer.tick >= 10) {
            timer.cancel();
          }
          List<Todo> sublist = posts.sublist(0, timer.tick);
          // ignore: avoid_print
          print("$sublist");
          streamController.sink.add(sublist);
          // ignore: avoid_print
          print('Tick: ${timer.tick}');
        });
      } else {
        throw Exception('error ');
      }
    } catch (e) {
      throw Exception('error iss::::${e.toString}');
    }
  }
}

// ignore: camel_case_types
class Todo_Futurebuider_BussinessLogic {
  ValueNotifier<bool> isDataload = ValueNotifier(false);
  Future<List<Todo>> getData() async {
    ValueNotifier<bool> isDataload = ValueNotifier(false);
    isDataload.value = false;
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Todo> posts = body
          .map(
            (dynamic item) => Todo.fromJson(item),
          )
          .toList();
      isDataload.value = true;
      return posts;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
