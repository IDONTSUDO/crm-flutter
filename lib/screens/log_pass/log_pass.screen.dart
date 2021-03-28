import 'package:bogdashka/components/BoxContainer.dart';
import 'package:bogdashka/components/BoxContainerCard.dart';
import 'package:bogdashka/components/widgets/Navigator.animation.dart';

import 'package:bogdashka/controllers/CourseController.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/screens/log_pass/widgets/LogPassCardBody.dart';
import 'package:bogdashka/screens/main/main_screen.dart';
import 'package:bogdashka/screens/main/widgets/AppBarMainScreen.dart';
import 'package:bogdashka/screens/main/widgets/BottomNavigationBarMainScreen.dart';
import 'package:bogdashka/service/Comerce.dart';

import 'package:flutter/material.dart';

import '../../enums.dart';
import '../../main.dart';

class LogPassScreen extends StatelessWidget {
  static String path = '/log_pass';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMainScreen(context),
        bottomNavigationBar: getBottomNavigationBarMainScreen(context),
        body: Container(
            child: Container(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            direction: Axis.vertical,
            children: [
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Spacer(),
                  Center(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flex(direction: Axis.horizontal, children: [
                          LogPassCardBody(),
                        ]),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        )));
  }
}
//  Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 verticalDirection: VerticalDirection.up,
//                 children: [
//                   Container(
//                     width: 165,
//                     height: 60,
//                     color: Theme.of(context).primaryColor,
//                     child: InkWell(
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image(
//                               image: new AssetImage('images/undo.png'),
//                               height: 30.0,
//                               width: 30,
//                             ),
//                           ),
//                           Text(
//                             'Назад',
//                             style:
//                                 TextStyle(color: kSecondaryColor, fontSize: 13),
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         navigationSideRoute(context, MainScreen());
//                       },
//                     ),
//                   ),
//                 ],
//               ),