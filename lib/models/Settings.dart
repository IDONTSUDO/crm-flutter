import 'dart:convert';

String iSettingsToJson(ISettings data) => json.encode(data.toJson());

class ISettings {
  ISettings({
    this.course,
    this.maxRoboxPay,
    this.mininalPay,
    this.id,
  });

  double course;
  double maxRoboxPay;
  double mininalPay;
  String id;

  factory ISettings.fromJson(Map<String, dynamic> json, String uuid) =>
      ISettings(
        course: double.parse(json["course"]),
        maxRoboxPay: double.parse(json["maxRoboxPay"]),
        mininalPay: double.parse(json["mininalPay"]),
        id: uuid,
      );

  Map<String, dynamic> toJson() => {
        "course": course,
        "maxRoboxPay": maxRoboxPay,
        "mininalPay": mininalPay,
        "id": id,
      };
}
