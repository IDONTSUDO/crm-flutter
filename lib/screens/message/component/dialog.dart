import 'package:bogdashka/controllers/dialog_controller.dart';
import 'package:bogdashka/helper/DateFormatter.dart';
import 'package:bogdashka/models/MessageRooms.dart';
import 'package:bogdashka/screens/splash/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: dialogService.messageStream$,
        builder: (context, AsyncSnapshot<MessageRooms> snapshot) {
          if (snapshot.data != null) {
            var messages = snapshot.data.messages;

            return Container(
              height: 555,
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].isAdmin == true
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].isAdmin == false
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // verticalDirection: VerticalDirection.up,
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              messages[index].message,
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              DateFormatter.getVerboseDateTimeRepresentation(
                                  messages[index].date),
                              style: TextStyle(fontSize: 10),
                            ),
                            messages[index].isAdmin == true
                                ? Icon(Icons.delete)
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return SizedBox(height: 555, child: buildLoadingWidget());
          }
        });
  }
}
