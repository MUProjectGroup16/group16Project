import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/route_manager.dart';
import 'package:dio/dio.dart';
import 'successful.dart';
import 'package:demo/styling.dart';

class Signupimage extends StatefulWidget {
  const Signupimage({Key key}) : super(key: key);

  @override
  State<Signupimage> createState() => _SignupimageState();
}

class _SignupimageState extends State<Signupimage> {
  var _imgPath;

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
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign up',
                          style: AppTheme.headline1,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upload your profile photo',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.normal,
                            color: Color(0x99000000),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(successful());
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
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: RaisedButton(
                        child: _ImageView(_imgPath),
                        onPressed: () {
                          _openGallery();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 40,
                      child: OutlineButton(
                        child: const Text(
                          "Continue",
                          style: AppTheme.title_medium,
                        ),
                        onPressed: () {
                          Get.to(successful());
                        },
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: EdgeInsets.all(20),
                    //     child: Center(
                    //       child: resultJson.length <= 0
                    //           ? Text("数据加载中...")
                    //           : Text(
                    //         resultJson,
                    //         style: const TextStyle(fontSize: 16),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: FileImage(imgPath),
            )),
      );
    }
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        _imgPath = image;
      },
    );
  }
}
