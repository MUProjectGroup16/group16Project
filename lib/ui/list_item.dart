import 'package:flutter/material.dart';
import 'package:demo/details_page.dart';
import 'package:demo/model/email.dart';
import 'package:demo/styling.dart';
import 'package:demo/ui/rounded_avatar.dart';

//列表设置处理，是否已读。。。。
class ListItem extends StatelessWidget {
  const ListItem({Key key, this.id, this.email, this.onDeleted, this.onSave})
      : super(key: key);

  final int id;
  final Email email;
  final VoidCallback onDeleted;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Dismissible(
          key: ObjectKey(email),
          dismissThresholds: const {
            DismissDirection.startToEnd: 0.4,
            DismissDirection.endToStart: 0.4,
          },
          onDismissed: (DismissDirection direction) {
            switch (direction) {
              case DismissDirection.endToStart:
                onDeleted();
                break;
              case DismissDirection.startToEnd:
              // TODO: Handle this case.
                onSave();
                break;
              default:
              // Do not do anything
            }
          },
          //左右滑动
          background: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFBA37),
                border: Border(
                  top: BorderSide(
                    width: 4,
                    color: AppTheme.surface_variant,
                  ),
                  left: BorderSide(
                    width: 4,
                    color: AppTheme.surface_variant,
                  ),
                  bottom: BorderSide(
                    width: 4,
                    color: AppTheme.surface_variant,
                  ),
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 24),
              child: email.isRead
                  ? Icon(
                Icons.bookmark,
                size: 24,
                color: AppTheme.error,
              )
                  : Icon(
                Icons.bookmark_outline_outlined,
                size: 24,
                color: AppTheme.on_primary,
              )),
          secondaryBackground: Container(
            decoration: BoxDecoration(
              color: AppTheme.primary,
              border: Border(
                top: BorderSide(
                  width: 4,
                  color: AppTheme.surface_variant,
                ),
                right: BorderSide(
                  width: 4,
                  color: AppTheme.surface_variant,
                ),
                bottom: BorderSide(
                  width: 4,
                  color: AppTheme.surface_variant,
                ),
              ),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Icon(
              Icons.delete_outline,
              size: 24,
              color: AppTheme.on_primary,
            ),
          ),
          //没有已读的话显示文字
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    offset: Offset(0.0, 1),
                    blurRadius: 2,
                    spreadRadius: -3,
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Material(
                    color: AppTheme.on_primary,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _header,
                            // if (!email.isRead)
                            const SizedBox(height: 8),
                            // if (!email.isRead)
                            _emailPreview,
                          ],
                        ),
                      ),
                      //点击跳转
                      onTap: () =>
                          Navigator.of(context).push<void>(
                            DetailsPage.route(context, id, email),
                          ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 4,),
                  email.isRead
                      ? Icon(
                    Icons.bookmark_rounded, color: AppTheme.error, size: 16,)
                      : SizedBox(width: 0,),
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget get _header {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  email.isRead ? SizedBox(width: 16,) : SizedBox(width: 0,),
                  Text(
                    '${email.sender} — ${email.time}',
                    style: AppTheme.list1,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                email.subject,
                style: AppTheme.list2,
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
                padding: EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.attachment,
                  size: 18,
                  color: Color(0x99000000),
                ),
              ),
            Flexible(
              child: Text(
                email.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTheme.list1.copyWith(fontSize: 14),
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
