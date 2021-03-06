import 'package:flutter/material.dart';
import 'package:flutter_app/learning/listView.dart';
import 'package:flutter_app/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      title: 'Task App',
      home:  ListViewTest(),
    );
  }
}
