import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/model/email.dart';
import 'styling.dart';
import 'package:demo/transition/expand_transition.dart';
import 'package:demo/ui/rounded_avatar.dart';

import 'model/email_model.dart';

//详情页
class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key key,
    @required this.id,
    @required this.email,
    @required this.sourceRect,
  })  : assert(id != null && email != null && sourceRect != null),
        super(key: key);

  static Route<dynamic> route(BuildContext context, int id, Email email) {
    final RenderBox box = context.findRenderObject();
    final Rect sourceRect = box.localToGlobal(Offset.zero) & box.size;

    Provider.of<EmailModel>(context, listen: false).currentlySelectedEmailId =
        id;

    return PageRouteBuilder<void>(
      pageBuilder: (BuildContext context, _, __) => DetailsPage(
        id: id,
        email: email,
        sourceRect: sourceRect,
      ),
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  @override
  _DetailsPageState createState() => _DetailsPageState();

  final int id;
  final Email email;
  final Rect sourceRect;
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: AppTheme.surface_variant),
      child: Container(
      padding: EdgeInsets.fromLTRB(8,8,8,0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(0.0, 1),
              blurRadius: 2,
              spreadRadius: -4,
            )
          ]
      ),
      child: ExpandItemPageTransition(
        source: widget.sourceRect,
        title: widget.email.subject,
        child: Material(
          child: SafeArea(
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.all(8),
              //color: ,
              child: Material(
                color: AppTheme.on_primary,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _header,
                      _body,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

//头部 标题加图标
  Widget get _header {
    final Animation<double> fadeAnimation = CurvedAnimation(
        parent: ModalRoute.of(context).animation, curve: Curves.fastOutSlowIn);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 0),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Text(
                        widget.email.subject,
                        style: AppTheme.headline_medium.copyWith(color: AppTheme.on_surface)
                    )
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  padding: const EdgeInsets.only(left: 16, top: 0, right: 16),
                  onPressed: () {
                    Provider.of<EmailModel>(context, listen: false)
                        .currentlySelectedEmailId = -1;
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          //第二行  时间 收件人头像
          child: Row(
            children: <Widget>[
              Expanded(
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget.email.sender} - ${widget.email.time}',
                        style: AppTheme.body_medium
                            .copyWith(color: Color(0x991A1C1E)),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'To ${widget.email.recipients}',
                        style: AppTheme.body_small
                            .copyWith(color: Color(0x661A1C1E)),
                      ),
                    ],
                  ),
                ),
              ),
              Hero(
                tag: widget.email.subject,
                child: RoundedAvatar(
                    image: 'assets/images/${widget.email.avatar}'),
              ),
            ],
          ),
        ),
      ],
    );
  }

//内容
  Widget get _body {
    final Animation<double> fadeAnimation = CurvedAnimation(
        parent: ModalRoute.of(context).animation, curve: Curves.fastOutSlowIn);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 24),
            Text(
              widget.email.message,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            if (widget.email.containsPictures) const SizedBox(height: 24),
            if (widget.email.containsPictures)
              Image.asset('assets/images/photo_grid.jpg'),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}
