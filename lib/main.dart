import 'package:flutter/material.dart';
import 'package:shortly/ui/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainWidget(), debugShowCheckedModeBanner: false);
  }
}

class MainWidget extends StatelessWidget {
  MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreen(),
    );
  }
}
