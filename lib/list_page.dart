import 'package:demo/connect/dio2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/connect/Global.dart';
import 'package:demo/model/email.dart';
import 'package:demo/model/email_model.dart';
import 'package:demo/transition/scale_out_transition.dart';
import 'package:demo/ui/list_item.dart';
import 'search/search_cell.dart';
import 'model/email_model.dart';
import 'styling.dart';
import 'home_page.dart';
import 'package:get/route_manager.dart';

class get3 extends StatelessWidget {
  get3(this.list, this.list1, {Key key}) : super(key: key);
  List list;
  List list1;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailModel>(builder: (
      BuildContext context,
      EmailModel model,
      Widget child,
    ) {
      model.emails.clear();
      if (list1.length > 0) {
        for (int i = list1.length - 1; i > 0; i--) {
          model.emails.add(
            Email(
                list1[i]["sendUserId"].toString(),
                list1[i]["sendTime"],
                list1[i]["title"],
                list1[i]["content"],
                "avatar.png",
                Global.userId,
                list1[i]["notificationId"],
                false,
                false,
                true),
          );
        }
      }
      if (list.length > 0) {
        for (int i = list.length - 1; i > 0; i--) {
          model.emails.add(
            Email(
                list[i]["sendUserId"].toString(),
                list[i]["sendTime"],
                list[i]["title"],
                list[i]["content"],
                "avatar.png",
                Global.userId,
                list[i]["notificationId"],
                false,
                false,
                false),
          );
        }
      }
      return ListPage();
    });
  }
}

//list表单  主页
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmailModel>(
      builder: (BuildContext context, EmailModel model, Widget child) {
        return ScaleOutTransition(
          child: Material(
            child: Container(
              decoration: new BoxDecoration(color: AppTheme.surface_variant),
              child: RefreshIndicator(
                onRefresh: _onrefresh,
                child: ListView.builder(
                  itemCount: model.emails.length + 1,
                  itemBuilder: (BuildContext context, int position) {
                    if (position == 0) {
                      return SearchCell();
                    }
                    if(model.emails.length == 0){
                      return Center(
                          child:Image.asset(
                            'assets/images/main-none.png',
                          ),
                      );
                    }
                    if (position > 0) {
                      position--;
                      return ListItem(
                        id: position,
                        email: model.emails[position],
                        onDeleted: () => model.deleteEmail(position),
                        onSave: () => model.saveEmail(position),
                      );
                    } else {
                      return Container(color: Colors.black,);
                    }

                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future _onrefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      Get.offAll(HomePage());
    });
  }
}
