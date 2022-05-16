import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';

class successful extends StatefulWidget {
  const successful({Key key}) : super(key: key);

  @override
  State<successful> createState() => _successfulState();
}

class _successfulState extends State<successful> {
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
                const SizedBox(
                  height: 20,
                ),
                Icon(Icons.person_add_alt,size: 100,),
                SizedBox(height: 20,),
                Text('your account has been created successfully',style: TextStyle(fontSize: 15),),
                SizedBox(height: 50,),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: RaisedButton(
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      postRequest();
                    },
                    color: Colors.blue,
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
