import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/connect/dio3.dart';
import 'package:demo/model/email_model.dart';
import 'package:demo/styling.dart';
import 'package:demo/transition/fab_fill_transition.dart';

import 'model/email.dart';
import 'connect/Global.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'home_page.dart';

//编辑页
///发送
class SendPage extends StatefulWidget {
  SendPage({Key key, @required this.sourceRect})
      : assert(sourceRect != null),
        super(key: key);

  static Route<dynamic> route(BuildContext context, GlobalKey key) {
    final RenderBox box = key.currentContext.findRenderObject();
    final Rect sourceRect = box.localToGlobal(Offset.zero) & box.size;

    return PageRouteBuilder<void>(
      pageBuilder: (BuildContext context, _, __) =>
          SendPage(sourceRect: sourceRect),
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  final Rect sourceRect;

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<SendPage> {
  String _recipientAvatar = 'avatar.png';
  bool keyboard = false;

  var resultJson = "";
  int receiveuserId = int.parse(Global.addcourse[0]);
  int senduserId = int.parse(Global.userId);
  var title = "";
  var contect = "";
  var file = null;

  @override
  void initState() {
    postHttp();
    super.initState();
  }

  postHttp() async {
    var path = "http://173.82.212.40:8989/notification/insert";
    var params = [
      {
        "receiveUserId": receiveuserId,
        "sendUserId": senduserId,
        "notificationStatue": 1,
        "title": title,
        "content": contect,
        "file": file,
      }
    ];

    Response response = await Dio().post(path, data: params);

    this.setState(() {
      resultJson = response.data;
    });
    print(resultJson);
    print(params);
    print("1111111");
  }

  @override
  Widget build(BuildContext context) {
    final EmailModel emailModel = Provider.of<EmailModel>(context);
    String fabIcon = 'assets/images/ic_edit.png';

    return Container(
      decoration: new BoxDecoration(color: AppTheme.surface_variant),
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            offset: Offset(0.0, 1),
            blurRadius: 2,
            spreadRadius: -4,
          )
        ]),
        child: FabFillTransition(
          source: widget.sourceRect,
          icon: fabIcon,
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    color: Color(0x0),
                    child: Material(
                      color: AppTheme.on_primary,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _subjectRow,
                            _spacer,
                            _recipientRow,
                            _spacer,
                            _titleRow,
                            _spacer,
                            _message,
                            _spacer,
                            _attachment,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    verticalDirection: VerticalDirection.up,
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: AppTheme.background,
                              height: 40,
                              child: MaterialButton(
                                child: Row(
                                  children: [
                                    IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.image_outlined,
                                        color: AppTheme.on_surface_variant,
                                      ),
                                      onPressed: () => print('aaa'),
                                    ),
                                    IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.insert_drive_file_outlined,
                                        color: AppTheme.on_surface_variant,
                                      ),
                                      onPressed: () => print('aaa'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _spacer {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child:
          Container(width: double.infinity, height: 1, color: AppTheme.outline),
    );
  }

//第一行 关闭和发送
  Widget get _subjectRow {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Global.addcourse.clear();
              Global.addcourse.add('-1');
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: AppTheme.on_surface_variant,
            ),
          ),
          Expanded(
              child: Center(
            child: Text("Send", style: AppTheme.subhead1),
          )),
          IconButton(
            onPressed: () {
              postHttp();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).pop();
                if (resultJson == "Success!") {
                  resultJson = "";
                  Global.addcourse.clear();
                  Global.addcourse.add('-1');
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (context) => new HomePage()),
                      (route) => route == null);
                }
              });
            },
            icon: Image.asset(
              'assets/images/ic_send.png',
              width: 24,
              height: 24,
              color: AppTheme.on_surface_variant,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _recipientRow {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "TO",
                  style: AppTheme.title_medium,
                  textAlign: TextAlign.center,
                ),
                //标签
                SizedBox(
                  width: MediaQuery.of(context).size.width - 116,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      _claas,
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    print(Global.addcourse[0]);
                    Get.to(dio3());
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _claas {
    if (Global.addcourse.length <= 1) {
      return Container();
    } else {
      receiveuserId = Global.addcourse[0];
      return RawChip(
        label: Text(Global.addcourse[1].toString()),
        onDeleted: () {
          print('onDeleted');
          setState(() {
            receiveuserId = Global.addcourse[0];
            Global.addcourse.clear();
            Global.addcourse.add('-1');
          });
        },
        deleteIcon: Icon(Icons.close_outlined),
        deleteButtonTooltipMessage: 'delete',
      );
    }
  }

  Widget get _titleRow {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        minLines: 1,
        maxLines: 1,
        decoration: InputDecoration.collapsed(
            hintText: 'Title',
            hintStyle:
                Theme.of(context).textTheme.caption.copyWith(fontSize: 14)),
        autofocus: false,
        style: AppTheme.body_medium,
        onChanged: (value) {
          title = value;
        },
      ),
    );
  }

  Widget get _message {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        minLines: 23,
        maxLines: 30,
        decoration: InputDecoration.collapsed(
            hintText: 'Message',
            hintStyle:
                Theme.of(context).textTheme.caption.copyWith(fontSize: 14)),
        autofocus: false,
        style: AppTheme.body_medium,
        onChanged: (value) {
          contect = value;
        },
      ),
    );
  }

  Widget get _attachment {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.attachment,
            color: Color(0x991A1C1E),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("null"),
        ],
      ),
    );
  }
}
