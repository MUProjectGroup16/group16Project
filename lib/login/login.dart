import 'dart:convert';

import 'package:demo/styling.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';

import '../home_page.dart';
import 'account_page.dart';
import '../connect/Global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var resultJson = "";
  var username = "";
  var password = "";
  int a = 0;

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  getHttp() async {
    var path = "http://173.82.212.40:8989/user/login";
    var params = {
      "email": username,
      "password": password,
    };

    Response response = await Dio().post(path, data: params);
    print(jsonDecode(response.data)["userId"]);

    this.setState(() {
      if (response.data != "data not exits") {
        a = jsonDecode(response.data)["userId"];
        resultJson = a.toString();
      } else {
        resultJson = "";
      }
    });
    print(response);
    setState(() {
      Global.userId = resultJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: new BoxDecoration(color: AppTheme.primary_container),
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    offset: Offset(0.0, 1),
                    blurRadius: 4,
                    spreadRadius: 4,
                  )
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome!',
                          style: AppTheme.headline1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'sign in to your account',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.normal,
                            color: Color(0x99000000),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        username = value;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock_open),
                        hintText: 'Password',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      child: MaterialButton(
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          getHttp();
                          Future.delayed(Duration(seconds: 1), () {
                            if (resultJson != "") {
                              resultJson = "";
                              Navigator.of(context).pushAndRemoveUntil(
                                  new MaterialPageRoute(
                                      builder: (context) => new HomePage()),
                                  (route) => route == null);
                            }
                            else{
                              Get.defaultDialog(middleText: "The email or the password is incorrect");
                            }
                          });
                        },
                        color: AppTheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width / 3 + 30,
                          height: 1,
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Container(
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width / 3 + 30,
                          height: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      child: OutlineButton(
                        child: const Text(
                          "Sign up",
                          style: AppTheme.title_medium,
                        ),
                        onPressed: () {
                          Get.to(accountPage());
                        },
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
