import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:demo/list_page.dart';
import '../model/email.dart';
import '../model/email_model.dart';
import 'Global.dart';
//消息的连接
class dio5 extends StatefulWidget {
  const dio5({Key key}) : super(key: key);

  @override
  State<dio5> createState() => _dio5State();
}

class _dio5State extends State<dio5> {
  List list2 = [];
  List list3 = [];

  @override
  void initState(){
    getHttp();
    super.initState();
  }
  getHttp() async{
    String a = Global.userId;
    String url = Global.url;
    var path = "$url/notification/selectByReceiverWaste?receiveUserId=$a";
    Response res = await Dio().get(path);
    this.setState(() {
      if (res.data != "data not exits") {
        list2 = jsonDecode(res.data);
      }
    });
  }


  Widget build(BuildContext context) {
    return get3(list2,list3);

  }
}
