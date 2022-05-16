import 'package:flutter/material.dart';
import 'package:reply/details_page.dart';
import 'package:reply/model/email.dart';
import 'package:reply/styling.dart';
import 'package:reply/ui/rounded_avatar.dart';

//列表设置处理，是否已读。。。。
class ListItem extends StatelessWidget {
  const ListItem({Key key, this.id, this.email, this.onDeleted})
      : super(key: key);

  final int id;
  final Email email;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(email),
      dismissThresholds: const {
        DismissDirection.startToEnd: 1,
        DismissDirection.endToStart: 0.4,
      },
      onDismissed: (DismissDirection direction) {
        switch (direction) {
          case DismissDirection.endToStart:
            onDeleted();
            break;
          case DismissDirection.startToEnd:
            // TODO: Handle this case.
            break;
          default:
          // Do not do anything
        }
      },
      //左右滑动
      background: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFBA37),
          border: Border.all(color: AppTheme.surface_variant, width: 2),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: const Icon(
          Icons.bookmark_outline_outlined,
          size: 24,
          color: AppTheme.on_primary,
        )
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          color: AppTheme.primary,
          border: Border.all(color: AppTheme.surface_variant, width: 2),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: const Icon(
          Icons.delete_outline,
          size: 24,
          color: AppTheme.on_primary,
        )
      ),
      //没有已读的话显示文字
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Material(
          color: AppTheme.on_primary,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _header,
                  // if (!email.isRead)
                    const SizedBox(height: 14),
                  // if (!email.isRead)
                    _emailPreview,
                ],
              ),
            ),
            //点击跳转
            onTap: () => Navigator.of(context).push<void>(
              DetailsPage.route(context, id, email),
            ),
          ),
        ),
      ),
    );
  }

  //已读颜色变淡
  Widget get _header {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${email.sender} — ${email.time}',
                style: AppTheme.body_small.copyWith(
                    color: email.isRead
                        ? AppTheme.deactivatedText
                        : AppTheme.darkText),
              ),
              const SizedBox(height: 2),
              Text(
                email.subject,
                // style: email.containsPictures ? AppTheme.headline_small : AppTheme.title_small.copyWith(color: email.isRead ? AppTheme.deactivatedText : AppTheme.darkText),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Hero(
            tag: email.subject,
            child: RoundedAvatar(image: 'assets/images/${email.avatar}')),
      ],
    );
  }

  //信件预览
  Widget get _emailPreview {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            if (email.hasAttachment)
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.attachment,
                  size: 24,
                  color: Color(0x99000000),
                ),
              ),
            Flexible(
              child: Text(
                email.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTheme.body_medium.copyWith(color: Color(0x99000000)),
              ),
            ),
          ],
        ),
        if (email.containsPictures) ..._miniGallery,
      ],
    );
  }

  //预览照片
  List<Widget> get _miniGallery {
    return <Widget>[
      const SizedBox(height: 21),
      SizedBox(
        width: double.infinity,
        height: 96,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List<Widget>.generate(
            5,
            (int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Image.asset(
                  'assets/images/photo$index.jpg',
                ),
              );
            },
          ),
        ),
      ),
    ];
  }
}
