import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';

import '../home_page.dart';
import 'sign_up.dart';
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
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
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
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                      ),
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
                      'sign in your account!',
                      style: TextStyle(fontWeight: FontWeight.w200),
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
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: MaterialButton(
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      getHttp();
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context).pop();
                        if (resultJson != "") {
                          resultJson = "";
                          Navigator.of(context).pushAndRemoveUntil(
                              new MaterialPageRoute(
                                  builder: (context) => new HomePage()),
                              (route) => route == null);
                        }
                      });
                    },
                    color: Colors.blue,
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
                      style: TextStyle(color: Colors.grey, fontSize: 16),
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
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: OutlineButton(
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Get.to(SignupPage());
                    },
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
