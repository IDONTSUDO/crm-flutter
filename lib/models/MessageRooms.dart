// To parse this JSON data, do
//
//     final messageRooms = messageRoomsFromJson(jsonString);

import 'dart:convert';

MessageRooms messageRoomsFromJson(String str) =>
    MessageRooms.fromJson(json.decode(str));

String messageRoomsToJson(MessageRooms data) => json.encode(data.toJson());

class MessageRooms {
  MessageRooms({
    this.created,
    this.count,
    this.messages,
    this.adminMissed,
    this.id,
    this.userMissed,
    this.user,
  });

  DateTime created;
  int count;
  List<Message> messages;
  int adminMissed;
  String id;
  int userMissed;
  String user;

  factory MessageRooms.fromJson(Map<String, dynamic> json) => MessageRooms(
        created: DateTime.parse(json["created"]),
        count: json["count"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        adminMissed: json["adminMissed"],
        id: json["id"],
        userMissed: json["userMissed"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "created": created.toIso8601String(),
        "count": count,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "adminMissed": adminMissed,
        "id": id,
        "userMissed": userMissed,
        "user": user,
      };
}

class Message {
  Message({
    this.user,
    this.message,
    this.isAdmin,
    this.date,
    this.read,
  });

  String user;
  String message;
  bool isAdmin;
  DateTime date;
  bool read;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        user: json["user"],
        message: json["message"],
        isAdmin: json["isAdmin"],
        date: DateTime.parse(json["date"]),
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "message": message,
        "isAdmin": isAdmin,
        "date": date.toIso8601String(),
        "read": read,
      };
}
