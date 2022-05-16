import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'successful.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key key}) : super(key: key);

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More details about you',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.alternate_email_outlined),
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
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Name',
                  ),
                  onChanged: (value) {
                    password = value;
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
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock_open),
                    hintText: 'Repeat Password',
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 25,
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
                      Get.to(successful());

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