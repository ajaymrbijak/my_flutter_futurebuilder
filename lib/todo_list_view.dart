import 'package:flutter/material.dart';

// ignore: camel_case_types
class Todo_ListView extends StatelessWidget {
  final String? title;
  final Function ontap;
  const Todo_ListView({Key? key, this.title, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      elevation: 6,
      shadowColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: ListTile(
        leading: const Icon(Icons.flag_circle_rounded,
            color: Color.fromARGB(214, 216, 56, 168)),
        title: Text(
          title ?? "",
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        trailing: const Icon(
          Icons.create_rounded,
          color: Color.fromARGB(255, 239, 239, 239),
        ),
        onTap: () {
          ontap();
        },
      ),
    );
  }
}
