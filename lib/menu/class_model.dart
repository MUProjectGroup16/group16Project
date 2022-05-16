import 'package:flutter/services.dart';

import 'class.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class classModel with ChangeNotifier {
  final List<classes> Classes = <classes>[
    classes("CS171FZ[A]", "Computer Systems 1", "(2021-22:Semester 1)", true),
    classes("CS171FZ[A]", "Computer Systems 1", "(2021-22:Semester 1)", true),
    classes("CS171FZ[A]", "Computer Systems 1", "(2021-22:Semester 1)", true),
    classes("CS171FZ[A]", "Computer Systems 1", "(2021-22:Semester 1)", true),
    classes("CS171FZ[A]", "Computer Systems 1", "(2021-22:Semester 1)", true),
    classes("CS171FZ[A]", "Lol", "(2021-22:Semester 1)", false),
  ];

// int _currentlySelectedEmailId = -1;
//
// List<classes> get classes => List<classes>.unmodifiable(_classes);
// List<Email> get emails => List<Email>.unmodifiable(_emails);
//
//
// void deleteEmail(int id) {
//   _emails.removeAt(id);
//   notifyListeners();
// }
//
// int get currentlySelectedEmailId => _currentlySelectedEmailId;
//
// set currentlySelectedEmailId(int value) {
//   _currentlySelectedEmailId = value;
//   notifyListeners();
// }

}







