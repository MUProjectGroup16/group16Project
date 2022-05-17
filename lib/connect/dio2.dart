import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:reply/list_page.dart';
import '../model/email.dart';
import '../model/email_model.dart';
import 'Global.dart';

class dio2 extends StatefulWidget {
  const dio2({Key key}) : super(key: key);

  @override
  State<dio2> createState() => _dio2State();
}

class _dio2State extends State<dio2> {
  List list2 = [];

  @override
  void initState(){
    getHttp();
    super.initState();
  }
  getHttp() async{
    String a = Global.userId;
    var path = "http://173.82.212.40:8989/notification/selectByReceiver?receiveUserId=$a";
    Response res = await Dio().get(path);
    this.setState(() {
      if (res.data != "data not exits") {
        list2 = jsonDecode(res.data);
      }
    });
  }


  Widget build(BuildContext context) {
    return ListPage();

  }
}
