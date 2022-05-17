import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:reply/menu/Manage_My_Courses.dart';
import '../menu/class_model.dart';
import '../menu/class.dart';
import 'Global.dart';
//课程的连接
class dio1 extends StatefulWidget {
  const dio1({Key key}) : super(key: key);

  @override
  State<dio1> createState() => _dio1State();
}

class _dio1State extends State<dio1> {
  List list = [];

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
        list = jsonDecode(res.data);
      }
    });
  }


  Widget build(BuildContext context) {
    return get1(list);

  }
}
