import 'package:demo/login/login.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import '../connect/Global.dart';
import '../main.dart';
import 'package:demo/styling.dart';

class successful extends StatefulWidget {
  const successful({Key key}) : super(key: key);

  @override
  State<successful> createState() => _successfulState();
}

class _successfulState extends State<successful> {
  var resultJson = "";

  @override
  void initState() {
    super.initState();
  }

  postRequest() async {
    var path = "http://173.82.212.40:8989/user/insert";
    var params = {
      "identity": false,
      "password": Global.password,
      "userName": Global.userName,
      "email": Global.email,
      "phone": Global.phone,
      "emailVisible": false,
      "phoneVisible": true,
      "studentId": Global.studentId
    };

    Response response = await Dio().post(path, data: params);

    this.setState(() {
      resultJson = response.toString();
    });
    print(resultJson);
    print("1111111");
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
                          'Sign up',
                          style: AppTheme.headline1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.person_add_alt,
                      size: 60,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'your account has been created successfully',
                      style: AppTheme.body_medium,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      child: MaterialButton(
                        child: Text(
                          "Log in",
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.1,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                        ),
                        onPressed: () {
                          postRequest();
                          Future.delayed(Duration(seconds: 1), () {
                            if (resultJson == "Success!") {
                              resultJson = "";
                              Navigator.of(context).pushAndRemoveUntil(
                                  new MaterialPageRoute(
                                      builder: (context) => new LoginPage()),
                                      (route) => route == null);
                            }
                            else{
                              Get.defaultDialog(middleText: "嗶哢嗶哢被玩壞了！"
                                  "這肯定不是嗶哢的問題！"
                                  "絕對不是！");
                            }
                          });
                        },
                        color: AppTheme.primary,
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
