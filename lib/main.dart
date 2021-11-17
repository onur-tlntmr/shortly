import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ui/widgets/control_panel.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              "assets/images/logo.svg",
              cacheColorFilter: true,
            ),
            SvgPicture.asset(
              "assets/images/illustration.svg",
              fit: BoxFit.cover,
            ),
            Text("Let's get started!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.deepPurple)),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            Text("Past your first link into\nthe field to shoten it",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            ControlPanel(),
          ],
        ),
      ),
    );
  }
}
