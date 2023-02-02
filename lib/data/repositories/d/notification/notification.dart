import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class NotificationApiService {
  static Future<int> sendNotificationToUser({required  String fcmToken, required String message}) async {
    String key =
        "key=AAAAezGK97o:APA91bEp0rFbg0o_vyfFAu5KOWa35jpsF5q5BLegA1uVKnX8lrKdmzo2ZQIeoMu2biuYw1B1qURtQ3jvbUBxyfatnSgl1uN8Zc4E95R0W63wKtic7_Iiq_t4aEvs144KFsrX4LL2CriM";
    var body = {
      "to": fcmToken,
      "notification": {
        "title": "Diqqat! Notification keldi",
        "body": message
      },
      "data": {
        "name": "Abdulloh",
        "age": 22,
        "job": "Programmer",
        "route": "chat"
      }
    };

    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");

    try {
      Response response = await https.post(
        uri,
        headers: {"Authorization": key, "Content-Type": "application/json"},
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        var t = jsonDecode(response.body);
        print("RESPONSE:$t");
        return jsonDecode(response.body)["success"] as int;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> sendNotificationToAll(String topicName) async {
    String key =
        "key=AAAAezGK97o:APA91bEp0rFbg0o_vyfFAu5KOWa35jpsF5q5BLegA1uVKnX8lrKdmzo2ZQIeoMu2biuYw1B1qURtQ3jvbUBxyfatnSgl1uN8Zc4E95R0W63wKtic7_Iiq_t4aEvs144KFsrX4LL2CriM";

    Map<String, dynamic> body = {
      "to": "/topics/$topicName",
      "notification": {
        "title": "Diqqat! Notification keldi",
        "body": "Bu notofication body"
      },
      "data": {
        "name": "Abdulloh",
        "age": 22,
        "job": "Programmer",
        "route": "chat"
      }
    };

    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
    try {
      Response response = await https.post(
        uri,
        headers: {
          "Authorization": key,
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["message_id"].toString();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}