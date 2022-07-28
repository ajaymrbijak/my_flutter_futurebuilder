import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late Future<List<User>> futureAlbum;
  ValueNotifier<bool> isDataload = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    futureAlbum = getData();
  }

  Future<List<User>> getData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> posts = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      throw Exception('Failed to load album');
    }
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
            // actions: [isDataload ? const Icon(Icons.done) : Container()],
            actions: [
              ValueListenableBuilder<bool>(
                valueListenable: isDataload,
                builder: (BuildContext context, bool value, Widget? child) {
                  if (value == true) {
                    return const Icon(Icons.done);
                  }
                  return Container();
                },
              ),
            ],
            title: const Text("Result Page")),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
                child: FutureBuilder<List<User>>(
                    future: futureAlbum,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      // print(snapshot.data);
                      if (snapshot.hasData) {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          isDataload.value = true;
                        });

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                  leading:
                                      const Icon(Icons.flag_circle_rounded),
                                  title: Text(snapshot.data[index].title),
                                  trailing: const Icon(Icons.create_rounded),
                                  // subtitle:
                                  //     Text(snapshot.data[index].id.toString()),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                                snapshot.data[index])));
                                  },
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else {
                        return const Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    }))
          ]),
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
        title: const Text("Details Of the Candiate"),
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
