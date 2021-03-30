import 'package:bogdashka/components/widgets/Liner.dart';
import 'package:bogdashka/components/widgets/SmoothScroll.dart';
import 'package:bogdashka/screens/main/widgets/BuyRobox.dart';
import 'package:bogdashka/controllers/CourseController.dart';
import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/screens/main/widgets/AppBarMainScreen.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'widgets/BottomNavigationBarMainScreen.dart';

class MainScreen extends StatelessWidget {
  static String path = '/main';
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    iSettingsBlock.getInvest();
    // controller.animateTo(-100, duration: Duration.zero, curve: Curves.linear);
    return Scaffold(
        appBar: appBarMainScreen(context),
        bottomNavigationBar: getBottomNavigationBarMainScreen(context),
        body: StreamBuilder<List<ISettings>>(
            stream: iSettingsBlock.subject,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return buildLoadingWidget();
              } else {
                double setingGrroup = snapshot.data[0].course;
                double settingLogPass = snapshot.data[1].course;
                double settingsTransfer = snapshot.data[2].course;

                return SmoothScrollWeb(
                  child: _getChild(
                      context, setingGrroup, settingLogPass, settingsTransfer),
                  controller: controller,
                );
              }
            }));
  }

  Widget _getChild(BuildContext context, double setingGrroup,
      double settingLogPass, double settingsTransfer) {
    return Container(
      height: 1000,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          BuyRoboxStep(setingGrroup, settingLogPass, settingsTransfer),
          Liner(),
          BuyRoboxStep(setingGrroup, settingLogPass, settingsTransfer),
          Liner(),
        ],
      ),
    );
  }
}
