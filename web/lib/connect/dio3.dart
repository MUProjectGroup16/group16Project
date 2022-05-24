import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:demo/menu/Manage_My_Courses.dart';
import 'Global.dart';
import '../addcourse.dart';
//课程的连接
class dio3 extends StatefulWidget {
  const dio3({Key key}) : super(key: key);

  @override
  State<dio3> createState() => _dio3State();
}

class _dio3State extends State<dio3> {
  List list2 = [];

  @override
  void initState(){
    getHttp();
    super.initState();
  }
  getHttp() async{
    String a = Global.userId;
    var path = "http://173.82.212.40:8989/course/selectCoursesByUser?userId=$a";
    Response res = await Dio().get(path);
    this.setState(() {
      if (res.data != "data not exits") {
        list2 = jsonDecode(res.data);
      }
    });
  }


  Widget build(BuildContext context) {
    return get2(list2);

  }
}
