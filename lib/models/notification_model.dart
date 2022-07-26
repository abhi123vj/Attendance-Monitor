// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

Notification notificationFromJson(Map<String, dynamic> str) => Notification.fromJson(str);


class Notification {
    Notification({
      required  this.success,
        this.notification,
    });

    bool success;
    List<NotificationElement> ?notification;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        success: json["success"] == null ? null : json["success"],
        notification: json["notification"] == null ? null : List<NotificationElement>.from(json["notification"].map((x) => NotificationElement.fromJson(x))),
    );

  
}

class NotificationElement {
    NotificationElement({
      required  this.id,
      required  this.title,
       required this.body,
        this.createdAt,
    });

    String id;
    String title;
    String body;
    DateTime? createdAt;

    factory NotificationElement.fromJson(Map<String, dynamic> json) => NotificationElement(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );
}
