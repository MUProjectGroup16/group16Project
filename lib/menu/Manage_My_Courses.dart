import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../transition/scale_out_transition.dart';
import '../ui/list_item.dart';
import 'package:demo/styling.dart';
import '../ui/class_item.dart';
import 'class_model.dart';
import 'class.dart';
import '../connect/Global.dart';

class get1 extends StatelessWidget {
  get1(this.list, {Key key}) : super(key: key);
  List list;

  @override
  Widget build(BuildContext context) {
    return Consumer<classModel>(builder: (BuildContext context,
        classModel model,
        Widget child,) {
      model.Classes.clear();
      for (int i = 0; i < list.length; i++) {
        model.Classes.add(classes(list[i]["courseCode"], list[i]["courseName"],
            list[i]["courseCode"], true, list[i]["courseId"]));
      }
      return ManagePage();
    });
  }
}

class ManagePage extends StatefulWidget {
  const ManagePage({Key key}) : super(key: key);

  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<ManagePage> {
  List<classes> chat1 = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<classModel>(
      builder: (BuildContext context,
          classModel model,
          Widget child,) {
        return Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // 触摸收起键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SafeArea(
              child: Material(
                color: Colors.white,
                child: Column(
                  children: [
                    _courseManagement,
                    _spacer,
                    SearchBar(
                      onChanged: (text) {
                        // _searchData(text);
                        chat1.clear(); // 每次搜索先情况
                        if (text.length > 0) {
                          if (chat1 != null) {
                            // 循环检索
                            for (int i = 0; i < model.Classes.length; i++) {
                              String name = model.Classes[i].id;
                              if ((name ?? "").contains(text)) {
                                chat1.add(model.Classes[i]);
                              }
                            }
                          }
                        }
                        setState(() {});
                      },
                    ),
                    MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: itemBuilder,
                            itemCount: chat1.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: AppTheme.primary,
            child: SizedBox(
              height: 56,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _spacer {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(width: double.infinity, height: 1, color: Colors.grey),
    );
  }

  Widget get _courseManagement {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 30,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: [
              SizedBox(
              width: 10,
              height: 60,
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: 80,
              height: 60,
            ),
            Text(
              'My Courses',
              style: AppTheme.subhead1,
              textAlign: TextAlign.center,
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.transparent,
              ),
            ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget itemBuilder(BuildContext context, int index) {
  //   return Consumer<classModel>(
  //     builder: (
  //       BuildContext context,
  //       classModel model,
  //       Widget child,
  //     ) {
  //       return CheckboxListTile(
  //         title: Text('${model.Classes[index].id} — ${model.Classes[index].name}',),
  //         subtitle: Text(model.Classes[index].time),
  //         value: model.Classes[index].ischoose,
  //         onChanged: (bool value) {
  //           setState(() {
  //             model.Classes[index].ischoose != value;
  //           });
  //         },
  //       );
  //     },
  //   );
  // }
  Widget itemBuilder(BuildContext context, int index) {
    return CheckboxListTile(
      title: Text(
        '${chat1[index].id} — ${chat1[index].name}',
      ),
      subtitle: Text(chat1[index].time),
      value: chat1[index].ischoose,
      onChanged: (bool value) {
        setState(() {
          chat1[index].ischoose == value;
        });
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
  bool _showClear = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 50,
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
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            onChanged: _onChanged,
                            cursorColor: Colors.green,
                            autofocus: true,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(Icons.search),
                              contentPadding:
                              EdgeInsets.only(left: 5, bottom: 10),
                              border: InputBorder.none,
                              labelText: 'search',
                            ),
                          ),
                        ),
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

  void _onChanged(String text) {
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }

    setState(() {
      // print(text.length < 0);
      _showClear = text.length > 0;
    });
  }
}
