import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'sign_up_image.dart';
import '../connect/Global.dart';
import 'package:demo/styling.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'More details about you',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.normal,
                            color: Color(0x99000000),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(Signupimage());
                            },
                            child: Text(
                              'Skip now',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.normal,
                                color: AppTheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                            )
                        )
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
                        Global.phone = value;
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
                        Global.studentId = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
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
                          Get.to(Signupimage());
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
