///new add
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/model/email.dart';
import 'package:demo/model/email_model.dart';
import '../transition/scale_out_transition.dart';
import '../ui/list_item.dart';
import 'search_cell.dart';

import 'package:demo/styling.dart';

class SearchPage extends StatefulWidget {
  final List<Email> email;

  const SearchPage({this.email});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Email> chat = [];//搜索结果的数组
  EmailModel model;//

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailModel>(
      builder: (
        BuildContext context,
        EmailModel model,
        Widget child,
      ) {
        return Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // 触摸收起键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: [
                SearchBar(
                  onChanged: (text) {
                    // _searchData(text);
                    chat.clear(); // 每次搜索先情况
                    if (text.length > 0) {//搜索功能
                      if (chat != null) {
                        // 循环检索
                        for (int i = 0; i < model.emails.length; i++) {
                          String name = model.emails[i].sender;
                          if ((name ?? "").contains(text)) {
                            chat.add(model.emails[i]);
                          }
                        }
                      }
                    }
                    setState(() {});
                  },
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemBuilder: itemBuilder,
                //   itemCount: chat.length,
                // ),
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: itemBuilder,//搜索结果的列表展示
                        itemCount: chat.length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: AppTheme.on_primary,
            child: SizedBox(
              height: 48,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => print(""),
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () => print(""),
                      icon: const Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // void _searchData(text) {
  //   chat.clear(); // 每次搜索先情况
  //   if (text.length > 0) {
  //     if (chat != null) {
  //       // 循环检索
  //       for (int i = 0; i < 5; i++) {
  //         print(model.emails.length);
  //         String name = model.emails[i].sender;
  //         if ((name ?? "").contains(text)) {
  //           chat.add(model.emails[i]);
  //         }
  //       }
  //     }
  //   }
  //   setState(() {});
  // }
  //

  Widget itemBuilder(BuildContext context, int index) {
    return Consumer<EmailModel>(
      builder: (
        BuildContext context,
        EmailModel model,
        Widget child,
      ) {
        // return Container(
        //   color: Colors.red,
        //   child: Text("${model.emails[index].sender}"),
        // );
        return ListItem(
          id: index,
          email: model.emails[index],
          onDeleted: () => model.deleteEmail(index),
        );
      },
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key key, this.onChanged}) : super(key: key);
  final ValueChanged<String> onChanged;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _showClear = false;///显示
  final TextEditingController _textEditingController = TextEditingController();///文本控制

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 20,
      ),
      child: Container(
        height: 57,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 44,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 34,
                    // margin: EdgeInsets.only(left: 5, right: 5),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,//监听控制
                            onChanged: _onChanged,
                            cursorColor: Colors.green,
                            autofocus: true,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 10),
                              border: InputBorder.none,
                              labelText: 'search',
                            ),
                          ),
                        ),
                        ///x
                        if (_showClear)
                          GestureDetector(
                            child: Icon(
                              Icons.cancel,
                              size: 20,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              _textEditingController.clear();
                              setState(() {
                                _onChanged("");
                              });
                            },
                          )
                      ],
                    ),
                  ), //圆角背景
                ],
              ),
            ),
            Container(
              height: 3,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
///x
  void _onChanged(String text) {//判断
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }

    setState(() {
      // print(text.length < 0);
      _showClear = text.length > 0;
    });
  }
// void _onChanged(String text) {
//   if (text.length > 0) {
//     setState(() {
//       _showClear = true;
//     });
//
//   } else {
//     setState(() {
//       _showClear = false;
//     });
//   }
// }

}
