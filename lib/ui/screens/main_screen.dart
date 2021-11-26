import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shortly/ui/widgets/control_panel.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top:25),
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              cacheColorFilter: true,
            ),
            SvgPicture.asset(
              "assets/images/illustration.svg",
              fit: BoxFit.scaleDown,
            ),
            const Text("Let's get started!",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "RobotoMono",
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.deepPurple)),
            const Text("Past your first link into\nthe field to shoten it",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "RobotoMono",
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      const ControlPanel(),
    ]);
  }
}
