import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shortly/Models/link.dart';

class CustomCard extends StatefulWidget {
  final Link link;
  final Function removeAction;

  CustomCard(this.link, this.removeAction);

  @override
  State<StatefulWidget> createState() {
    return CustomCardState();
  }
}

class CustomCardState extends State<CustomCard> {
  //Click flag
  var isClick = false;

  //for button style change
  var beforeColor = Color.fromRGBO(42, 207, 207, 1);

  var afterColor = Color.fromRGBO(59, 48, 84, 1);

  var beforeText = "Copy";
  var afterText = "Copied!";

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        child: Padding(
          padding: EdgeInsets.all(17),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.link.url,
                      style: TextStyle(
                          fontFamily: "RobotoMono",
                          overflow: TextOverflow.ellipsis,
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(53, 50, 62, 1)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.removeAction();
                      },
                      icon: SvgPicture.asset("assets/images/del.svg"))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(widget.link.shortLink,
                    style: TextStyle(
                        fontFamily: "RobotoMono",
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(42, 207, 207, 1))),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  //clipboard copy
                  Clipboard.setData(ClipboardData(text: widget.link.shortLink));
                  setState(() {
                    this.isClick = !isClick; //flag triggered
                  });
                },
                child: Text(
                  isClick ? afterText : beforeText,
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: isClick ? afterColor : beforeColor,
                  minimumSize: Size(double.infinity, 55),
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
