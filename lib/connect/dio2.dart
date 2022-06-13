import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:demo/list_page.dart';
import '../model/email.dart';
import '../model/email_model.dart';
import 'Global.dart';
//消息的连接
class dio2 extends StatefulWidget {
  const dio2({Key key}) : super(key: key);

  @override
  State<dio2> createState() => _dio2State();
}

class _dio2State extends State<dio2> {
  List list2 = [];
  List list3 = [];

  @override
  void initState(){
    getHttp();
    get1Http();
    get2Http();
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
  get1Http() async{
    String a = Global.userId;
    var path = "http://173.82.212.40:8989/notification/selectByReceiverCollection?receiveUserId=$a";
    Response res = await Dio().get(path);
    this.setState(() {
      if (res.data != "data not exits") {
        list3 = jsonDecode(res.data);
      }
    });
  }
  get2Http() async{
    String a = Global.userId;
    var path = "http://173.82.212.40:8989/user/select?userId=$a";
    Response res = await Dio().get(path);
    this.setState(() {
      if (res.data != "data not exits") {
        Global.userName1 = jsonDecode(res.data)["userName"];
        Global.email1 = jsonDecode(res.data)["email"];
      }
    });
  }

  Widget build(BuildContext context) {
    return get3(list2,list3);

  }
}
