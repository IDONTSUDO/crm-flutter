import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:bogdashka/controllers/Statistic_controllet.dart';
import 'package:bogdashka/controllers/auth_controller.dart';
import 'package:bogdashka/screens/splash/loader.dart';

import '../constants.dart';

final obk = {};

class Header extends StatelessWidget {
  final AuthController auth = Get.put(AuthController.instance());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            // width: 224,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFE7EEF0),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: kDefaultPadding),
              ),
            ),
          ),
          kDivider,
          Expanded(child: CurrentTime()),
          kDivider,
          Expanded(child: Text('SERVER ERR')),
          //      Text(
          //   "ONLINE NOW 42",
          //   textAlign: TextAlign.center,
          // )
          kDivider,
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                    stream: statisticService.getStatistic(),
                    // ignore: missing_return
                    builder: (context,
                        AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
                      if (snapshot.data == null) {
                        buildLoadingStatWidget();
                        buildLoadingStatWidget();
                        buildLoadingStatWidget();
                      } else {
                        return Text('312');
                      }
                      return buildLoadingStatWidget();
                    })

                // buildLoadingStatWidget(),
                // // buildInfo(context,
                // //     text: "Sale today: 98147/105000", percentage: 95.1),
                // buildLoadingStatWidget(),
                // // buildInfo(context,
                // //     text: "Money Today: 95/100", percentage: 93.8),
                // buildLoadingStatWidget(),
                // // buildInfo(context,
                // //     text: "Online today: 1033/1050", percentage: 95.1),
              ],
            ),
          ),
          kDivider,
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfo(context,
                    text: "ave. phone call: 153/130", percentage: 117.1),
                buildInfo(context,
                    text: "ave. ansver time: 3/5",
                    percentage: -2,
                    color: kRedColor),
                buildInfo(context,
                    text: "self points: 10/35",
                    percentage: 28.6,
                    color: kRedColor),
              ],
            ),
          ),
          kDivider,
          // Text(auth.user.displayName),
          //  FirebaseAuth.instance.currentUser.email
          Text('TEST USER'),
          SizedBox(width: kDefaultPadding),
        ],
      ),
    );
  }

  Widget buildLoadingStatWidget() {
    return Center(
        child: SizedBox(
      child: CircularProgressIndicator(),
      height: 10,
      width: 10,
    ));
  }

  Row buildInfo(BuildContext context,
      {@required String text,
      @required double percentage,
      Color color = kGreenColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        Container(
          width: 51,
          margin: EdgeInsets.only(left: kDefaultPadding / 2, bottom: 2),
          padding: EdgeInsets.symmetric(horizontal: 5),
          color: color.withOpacity(0.29),
          child: Text(
            "$percentage%",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class CurrentTime extends StatefulWidget {
  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  Timer _timer;

  String _systemTime;

  @override
  void initState() {
    super.initState();
    _systemTime = getSystemTime();
    _timer = Timer.periodic(Duration(minutes: 1), (_) {
      setState(() {
        _systemTime = getSystemTime();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("H:m").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _systemTime,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          "online time",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
