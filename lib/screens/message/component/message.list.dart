import 'package:bogdashka/controllers/dialog_controller.dart';
import 'package:bogdashka/controllers/message_controller.dart';
import 'package:bogdashka/helper/DateFormatter.dart';
import 'package:bogdashka/models/MessageRooms.dart';
import 'package:bogdashka/screens/message/component/message_rounded.dart';
import 'package:bogdashka/screens/message/message_screen.dart';
import 'package:bogdashka/screens/splash/loader.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../dialog_screen.dart';

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
                child: MessageContainer(
                  title: "Message List",
                  children: [
                    SizedBox(
                        height: 700,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var renderMessageRoom = snapshot.data[index];
                              Message lastMessage = renderMessageRoom.messages[
                                  renderMessageRoom.messages.length - 1];

                              return messageDetailsBuild(context,
                                  user: renderMessageRoom.user,
                                  isAdmin: lastMessage.isAdmin,
                                  read: lastMessage.read,
                                  message: lastMessage.message,
                                  countMissing:
                                      renderMessageRoom.adminMissed.toString(),
                                  messageId: renderMessageRoom.id,
                                  lastMessageTime: lastMessage.date.toString());
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
    {String user,
    bool isAdmin,
    bool read,
    String message,
    String countMissing,
    String right,
    String messageId,
    String lastMessageTime}) {
  if (message.length > 50) {
    message = message.substring(0, 50) + '...';
    print(message);
  }
  bool reader = (read == false) & (read == false);
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: kBackgroundColor),
        color: reader ? (Color.fromARGB(40, 204, 204, 0xF5)) : ('')),
    child: Ink(
      color: Colors.green,
      height: 40,
      child: new InkWell(
        splashColor: Colors.blue,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75),
              child: Row(children: [
                Text(
                  '+' + countMissing,
                  style: TextStyle(fontSize: 20),
                )
              ]),
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
            Spacer(),
            Container(
                child: Text(DateFormatter.getVerboseDateTimeRepresentation(
                    DateTime.parse(lastMessageTime))))
          ],
        ),
        onTap: () {
          dialogService.setDialog(messageId);
          Navigator.pushNamed(
            context,
            DialogScreen.path,
          );
        },
      ),
    ),
  );
}
