import 'package:bogdashka/controllers/message_controller.dart';
import 'package:bogdashka/models/MessageRooms.dart';
import 'package:bogdashka/screens/order/components/rounded_container.dart';
import 'package:bogdashka/screens/splash/loader.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: messageService.getMessageList(),
        builder: (context, AsyncSnapshot<List<MessageRooms>> snapshot) {
          if (snapshot.data != null) {
            return SizedBox(
                height: 750,
                width: 900,
                child: RoundedContainer(
                  title: "Message List",
                  children: [
                    SizedBox(
                        height: 700,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var renderMessageRoom = snapshot.data[index];
                              var lastMessage = renderMessageRoom
                                  .messages[
                                      renderMessageRoom.messages.length - 1]
                                  .message;
                              return messageDetailsBuild(
                                context,
                                // leftData: renderMessageRoom.user,
                                // leftTitle: lastMessage,
                                // rightData: renderMessageRoom.adminMissed,
                                // rightTitle: snapshot.data[index].payLogin,
                                // right: snapshot.data[index].service
                              );
                            }))
                  ],
                ));
          } else {
            return buildLoadingWidget();
          }
        });
  }
}

Container messageDetailsBuild(BuildContext context,
    {String user = 'IDONTSUDO',
    String rightData = '132',
    String message = 'КАК ДЕЛА ?',
    String countMissing = '312',
    String right = '321'}) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: kBackgroundColor)),
    child: Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: Row(children: [Text('+' + countMissing)]),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: "$user\n",
              children: [
                TextSpan(
                  text: message,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: kSecondaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
