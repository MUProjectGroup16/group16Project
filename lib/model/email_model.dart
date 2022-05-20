import 'package:flutter/widgets.dart';

import 'email.dart';

class EmailModel with ChangeNotifier {

  final List<Email> emails = <Email>[];

  int _currentlySelectedEmailId = -1;

  // List<Email> get emails => List<Email>.unmodifiable(_emails);

  void deleteEmail(int id) {
    emails.removeAt(id);
    notifyListeners();
  }

  int get currentlySelectedEmailId => _currentlySelectedEmailId;

  set currentlySelectedEmailId(int value) {
    _currentlySelectedEmailId = value;
    notifyListeners();
  }


}
