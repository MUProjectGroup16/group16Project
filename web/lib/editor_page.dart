import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply/model/email_model.dart';
import 'package:reply/styling.dart';
import 'package:reply/transition/fab_fill_transition.dart';

import 'model/email.dart';

//编辑页

class EditorPage extends StatefulWidget {
  const EditorPage({Key key, @required this.sourceRect})
      : assert(sourceRect != null),
        super(key: key);

  static Route<dynamic> route(BuildContext context, GlobalKey key) {
    final RenderBox box = key.currentContext.findRenderObject();
    final Rect sourceRect = box.localToGlobal(Offset.zero) & box.size;

    return PageRouteBuilder<void>(
      pageBuilder: (BuildContext context, _, __) =>
          EditorPage(sourceRect: sourceRect),
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  final Rect sourceRect;

  @override
  _EditorPageState createState() => _EditorPageState();
}
// class EditorPage extends StatefulWidget {
//   const EditorPage({
//     Key key,
//     @required this.id,
//     @required this.email,
//     @required this.sourceRect,
//   })  : assert(id != null && email != null && sourceRect != null),
//         super(key: key);
//
//   static Route<dynamic> route(BuildContext context, int id, Email email) {
//     final RenderBox box = context.findRenderObject();
//     final Rect sourceRect = box.localToGlobal(Offset.zero) & box.size;
//
//     Provider.of<EmailModel>(context,listen: false).currentlySelectedEmailId = id;
//
//     return PageRouteBuilder<void>(
//       pageBuilder: (BuildContext context, _, __) => EditorPage(
//         id: id,
//         email: email,
//         sourceRect: sourceRect,
//       ),
//       transitionDuration: const Duration(milliseconds: 350),
//     );
//   }
//
//   @override
//   _EditorPageState createState() => _EditorPageState();
//
//   final int id;
//   final Email email;
//   final Rect sourceRect;
// }

class _EditorPageState extends State<EditorPage> {
  String _recipientAvatar = 'avatar.png';
  bool keyboard = false;

  @override
  Widget build(BuildContext context) {
    final EmailModel emailModel = Provider.of<EmailModel>(context);
    String fabIcon = 'assets/images/ic_edit.png';

    if (emailModel.currentlySelectedEmailId >= 0) {
      // We reply to an email, so let's change the icon during the transition
      fabIcon = 'assets/images/ic_reply.png';

      final Email replyToEmail =
          emailModel.emails[emailModel.currentlySelectedEmailId];
      _recipientAvatar = replyToEmail.avatar;
    }

    return FabFillTransition(
      source: widget.sourceRect,
      icon: fabIcon,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                margin: const EdgeInsets.all(4),
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
                          height: 50,
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
                          )),
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
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: AppTheme.on_surface_variant,
            ),
          ),
          Expanded(
              child: Center(
            child: Text("reply", style: Theme.of(context).textTheme.subtitle2),
          )),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
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
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Wrap(
              children: <Widget>[
                //标签
                Chip(
                  //圆形头像
                  //backgroundColor: AppTheme.chipBackground,
                  // padding: EdgeInsets.zero,
                  backgroundColor: AppTheme.on_primary,
                  side: BorderSide(color: Colors.black, width: 1),
                  padding: EdgeInsets.only(
                    left: 4,
                    top: 4,
                    bottom: 4,
                  ),
                  avatar: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/$_recipientAvatar'),
                  ),
                  // label: Text(_recipient, style: Theme.of(context).textTheme.subtitle1)
                  label: Text("Teacher",
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ],
            ),
          ),
          // const Icon(
          //   Icons.add_circle_outline,
          //   color: AppTheme.lightText,
          // )
        ],
      ),
    );
  }

  Widget get _message {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        minLines: 23,
        maxLines: 30,
        decoration: InputDecoration.collapsed(hintText: 'Message'),
        autofocus: false,
        style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
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

