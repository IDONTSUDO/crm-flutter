import 'package:bogdashka/controllers/notification_controller.dart';
import 'package:flutter/material.dart';

class NotificationPopover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: StreamBuilder<String>(
        stream: notificationBloc.subject.stream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == '') {
              return SizedBox(width: 0, height: 0);
            } else {
              return SafeArea(
                child: Material(
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Container(
                        decoration: ShapeDecoration(
                            color: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          } else {
            return SizedBox(width: 0, height: 0);
          }
        },
      ),
    );
  }
}
