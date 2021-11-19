import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shortly/Models/link.dart';
import 'package:shortly/services/link_history_service.dart';
import 'package:shortly/utils/link_generator.dart';

class ControlPanel extends StatefulWidget {
  ControlPanel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ControlPanelState();
  }
}

class _ControlPanelState extends State<ControlPanel> {
  var service = LinkHistoryService();

  var linkGenerator = LinkGenerator();

  var txtController = TextEditingController();

  var isEmptySubmit = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 180,
            color: Color.fromRGBO(59, 48, 84, 1.0)),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(
            "assets/images/shape.svg",
            fit: BoxFit.cover,
            color: Color.fromRGBO(75, 63, 107, 1.0),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 45, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  controller: txtController,
                  style: TextStyle(
                      color: isEmptySubmit ? Colors.red : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isEmptySubmit ? Colors.red : Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: isEmptySubmit
                          ? "Please add a link here!"
                          : "Shorten a link here...",
                      hintStyle: TextStyle(
                          color: isEmptySubmit ? Colors.red : Colors.black38,
                          fontSize: 24,
                          fontWeight: FontWeight.w800)),
                ),
                SizedBox(height: 15),
                TextButton(
                    onPressed: () {
                      var url = txtController.text;
                      if (url.isEmpty) {
                        setState(() {
                          isEmptySubmit = true;
                        });
                      }
                      if (Uri.parse(url).isAbsolute) {
                        var shortLink = linkGenerator.generateShortLink();
                        var link = Link.withParams(url, shortLink);

                        service.addLink(link);

                        if (ModalRoute.of(context)!.settings.name !=
                            "HistoryScreen") {
                          Navigator.of(context).pushNamed("HistoryScreen");
                          txtController.clear();
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter a valid address"),
                        ));
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(42, 207, 207, 1),
                      minimumSize: Size(double.infinity, 55),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: Text(
                      "Shorten It",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ],
            ))
      ],
    );
  }
}
