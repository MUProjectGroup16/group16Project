import 'package:demo/connect/Global.dart';
import 'package:flutter/widgets.dart';

import 'email.dart';
import '../connect/dio4.dart';
import 'package:dio/dio.dart';

class EmailModel with ChangeNotifier {

  final List<Email> emails = <Email>[
  ];

  int _currentlySelectedEmailId = -1;

  int get currentlySelectedEmailId => _currentlySelectedEmailId;

  set currentlySelectedEmailId(int value) {
    _currentlySelectedEmailId = value;
    notifyListeners();
  }

  // List<Email> get emails => List<Email>.unmodifiable(_emails);

  void deleteEmail(int id) async{
    String url = Global.url;
    print(emails[id].courseid);
    print(emails[id].message);
    print(emails[id].subject);
    print(id);

    await HttpManager.post("$url/notificationCWD/insertWaste",
        {
          "userId": int.parse(Global.userId),
          "notificationId": emails[id].courseid,
        }
    );
    emails.removeAt(id);
  }
  void saveEmail(int id) async{
    String url = Global.url;
    emails[id].isRead = true;
    print(emails[id].id);
    print(emails[id].message);
    print(emails[id].subject);
    print(id);

    await HttpManager.post("$url/notificationCWD/insertCollection",
        {
          "userId": int.parse(Global.userId),
          "notificationId": emails[id].courseid,
        }
    );
    emails.removeAt(id);
    // notifyListeners();
  }




}
