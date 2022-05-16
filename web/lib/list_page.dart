import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply/model/email_model.dart';
import 'package:reply/transition/scale_out_transition.dart';
import 'package:reply/ui/list_item.dart';
import 'search/search_cell.dart';

//list表单  主页
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmailModel>(
      builder: (BuildContext context, EmailModel model, Widget child) {
        return ScaleOutTransition(
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(3),
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
