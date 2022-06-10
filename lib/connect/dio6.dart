import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:demo/list_page.dart';
import '../model/email.dart';
import '../model/email_model.dart';
import 'Global.dart';
//消息的连接
class dio6 extends StatefulWidget {
  const dio6({Key key}) : super(key: key);

  @override
  State<dio6> createState() => _dio6State();
}

class _dio6State extends State<dio6> {
  List list2 = [];
  List list3 = [];

  @override
  void initState(){
    getHttp();
    super.initState();
  }
  getHttp() async{
    String a = Global.userId;
    var path = "http://173.82.212.40:8989/notification/selectByReceiverCollection?receiveUserId=$a";
    Response res = await Dio().get(path);
    this.setState(() {
      if (res.data != "data not exits") {
        list3 = jsonDecode(res.data);
      }
    });
  }


  Widget build(BuildContext context) {
    return get3(list2,list3);

  }
}
