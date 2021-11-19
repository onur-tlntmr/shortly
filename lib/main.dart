import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly/services/link_history_service.dart';
import 'package:shortly/ui/screens/history_screen.dart';
import 'package:shortly/ui/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Providers has been added for observable the data
    return ChangeNotifierProvider<LinkHistoryService>(
      create: (context) => LinkHistoryService(),
      child: MaterialApp(
          home: MainWidget(),
          //for easy navigation
          routes: {'HistoryScreen': (BuildContext context) => HistoryScreen()},

          //hiding debug banner
          debugShowCheckedModeBanner: false),

    );
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
