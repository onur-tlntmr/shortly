import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly/services/link_history_service.dart';
import 'package:shortly/ui/widgets/card.dart';
import 'package:shortly/ui/widgets/control_panel.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LinkHistoryService service = context.watch<LinkHistoryService>();

    var txtStyle = TextStyle(
        fontFamily: "RobotoMono",
        fontSize: 24,
        color: Color.fromRGBO(53, 50, 62, 1));

    var backColor = Color.fromRGBO(240, 241, 246, 1.0);

    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              color: backColor,
              child: Padding(
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
            Consumer<LinkHistoryService>(
              builder: (context, service, child) => ListView.builder(
                itemCount: service.getSize(),
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(service.get(index),
                      () => {service.removeAtLink(index)});
                },
              ),
            ),
          ])),
          ControlPanel()
        ],
      ),
    );
  }
}
