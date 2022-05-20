import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply/connect/Global.dart';
import 'package:reply/model/email.dart';
import 'package:reply/model/email_model.dart';
import 'package:reply/transition/scale_out_transition.dart';
import 'package:reply/ui/list_item.dart';
import 'search/search_cell.dart';
import 'model/email_model.dart';
import 'styling.dart';

class get3 extends StatelessWidget {
  get3(this.list, {Key key}) : super(key: key);
  List list;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailModel>(builder: (
        BuildContext context,
        EmailModel model,
        Widget child,
        ) {
      model.emails.clear();
      for (int i = 0; i < list.length; i++) {
        print(list[i]["sendTime"]);
        model.emails.add(Email("1",list[i]["sendTime"],list[i]["title"],list[i]["content"],"avatar.png",Global.userId,false,false,false));
        model.emails.add( Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, false),);
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
              child: ListView.builder(
                itemCount: model.emails.length + 1,
                itemBuilder: (BuildContext context, int position) {
                  if(position == 0){
                    return SearchCell();
                  }
                  position--;
                  return ListItem(
                    id: position + 1,
                    email: model.emails[position],
                    onDeleted: () => model.deleteEmail(position),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
