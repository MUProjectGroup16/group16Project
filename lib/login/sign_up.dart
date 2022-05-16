import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'sign_up_image.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var resultJson = "";
  var username = "";
  var password = "";

  @override
  void initState() {
    super.initState();
  }

  postRequest() async {
    var path = "http://173.82.212.40:8989/user/login";
    var params = {
      "email": "123@Test2",
      "password": "222222",
    };

    Response response = await Dio().post(path, data: params);

    this.setState(() {
      resultJson = response.toString();
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
                      'Sign up',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More details about you',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(Signupimage());
                        },
                        child: Text(
                          'Skip now',
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.local_phone_outlined),
                    hintText: 'Phone',
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
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Student ID',
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: OutlineButton(
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Get.to(Signupimage());

                    },
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: resultJson.length <= 0
                          ? Text("数据加载中...")
                          : Text(
                        resultJson,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
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
