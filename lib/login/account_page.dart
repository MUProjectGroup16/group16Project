import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'sign_up.dart';
import '../connect/Global.dart';
import 'package:demo/styling.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key key}) : super(key: key);

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create an account',
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
                        icon: Icon(Icons.alternate_email_outlined),
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        Global.email = value;
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
                        Global.userName = value;
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
                      // onChanged: (value) {
                      //   password = value;
                      // },
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
                        Global.password = value;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 40,
                      child: OutlineButton(
                        child: const Text(
                          "Continue",
                          style: AppTheme.title_medium,
                        ),
                        onPressed: () {
                          Get.to(SignupPage());
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
