import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly/services/link_history_service.dart';
import 'package:shortly/ui/widgets/card.dart';
import 'package:shortly/ui/widgets/control_panel.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const txtStyle = TextStyle(
        fontFamily: "RobotoMono",
        fontSize: 24,
        color: Color.fromRGBO(53, 50, 62, 1));

    const backColor = Color.fromRGBO(240, 241, 246, 1.0);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              color: backColor,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  "Your Link History",
                  textAlign: TextAlign.center,
                  style: txtStyle,
                ),
              ),
            ),
          ),
          Expanded(
              child: Stack(children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  color: backColor,
                  // color: Colors.red,
                )),
            Consumer<LinkHistoryService>( //getting provider obj.
              builder: (context, service, child) => ListView.builder(
                itemCount: service.getSize(),
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(service.get(index),
                      () => {service.removeAtLink(index)});
                },
              ),
            ),
          ])),
          const ControlPanel()
        ],
      ),
    );
  }
}
