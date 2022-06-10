import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/editor_page.dart';
import 'package:demo/list_page.dart';
import 'package:demo/model/email.dart';
import 'package:demo/model/email_model.dart';
import 'package:demo/send_page.dart';
import 'package:demo/styling.dart';
import 'package:demo/transition/scale_out_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:get/get.dart';
import 'package:demo/setting_page/setting.dart';
import 'package:demo/menu/course_management.dart.dart';
import 'connect/dio2.dart';
import 'search/search bar.dart';
import 'user_page.dart';
import 'package:demo/setting_page/trash.dart';

//主界面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  final GlobalKey _fabKey = GlobalKey();
  final PageRouteBuilder<void> _initialRoute = PageRouteBuilder<void>(
      pageBuilder: (BuildContext context, _, __) => dio2());
  PanelController _pc = new PanelController();
  bool up = true;

  @override
  Widget build(BuildContext context) {
    //添加导航拦截
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: SlidingUpPanel(
          body: ScaleOutTransition(
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (RouteSettings settings) {
                if (settings.name == Navigator.defaultRouteName) {
                  return _initialRoute;
                }
              },
            ),
          ),
          panelBuilder: (ScrollController sc) => _scrollingList(sc),
          minHeight: 0,
          maxHeight: 288,
          controller: _pc,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          isDraggable: false,
          backdropOpacity: 0.3,
          backdropEnabled: true,
          color: Color(0xFF001E30),
        ),

        //底部导航栏
        bottomNavigationBar: _bottomNavigation,
        //浮动按钮
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _fab,
      ),
    );
  }

  Widget get _bottomNavigation {
    //动画效果，升起或下降
    final Animation<Offset> slideIn =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
            CurvedAnimation(
                parent: ModalRoute.of(context).animation, curve: Curves.ease));
    final Animation<Offset> slideOut =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1)).animate(
            CurvedAnimation(
                parent: ModalRoute.of(context).secondaryAnimation,
                curve: Curves.fastOutSlowIn));

    return SlideTransition(
      position: slideIn,
      child: SlideTransition(
        position: slideOut,
        child: BottomAppBar(
          color: AppTheme.primary,
          //中间挖个洞，正方形加边角变成圆
          // shape:
          //     AutomaticNotchedShape(RoundedRectangleBorder(), CircleBorder()),
          // //和按钮的距离
          // notchMargin: 8,
          child: SizedBox(
            height: 56,
            child: Row(
              children: <Widget>[
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  iconSize: 56,
                  icon: Row(
                    //主轴对齐
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        Icons.menu,
                        color: AppTheme.on_primary,
                        size: 24,
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (up) {
                      _pc.open();
                      up = false;
                    } else {
                      _pc.close();
                      up = true;
                    }
                  },
                ),
                //spacer增加距离
                Spacer(),
                _actionItems,
              ],
            ),
          ),
        ),
      ),
    );
  }

//状态管理 两个model转换
  Widget get _actionItems {
    return Consumer<EmailModel>(
      builder: (BuildContext context, EmailModel model, Widget child) {
        final bool showSecond = model.currentlySelectedEmailId >= 0;

        return AnimatedCrossFade(
          //动画曲线
          firstCurve: Curves.fastOutSlowIn,
          secondCurve: Curves.fastOutSlowIn,
          sizeCurve: Curves.fastOutSlowIn,
          //
          firstChild: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(
              Icons.person_outline,
              color: AppTheme.on_primary,
            ),
            onPressed: () async {
              Get.to(HomeContent());
              print("aa");
            },
          ),
          //右边第二套图标
          secondChild: showSecond
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(
                        Icons.bookmark_outline_outlined,
                        color: AppTheme.on_primary,
                        size: 24,
                      ),
                      onPressed: () => print('bb!'),
                    ),
                  ],
                )
              : const SizedBox(),
          crossFadeState:
              showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 300),
        );
      },
    );
  }

  Widget get _fab {
    return AnimatedBuilder(
      animation: ModalRoute.of(context).animation,
      child: Consumer<EmailModel>(
        builder: (BuildContext context, EmailModel model, Widget child) {
          final bool showEditAsAction = model.currentlySelectedEmailId == -1;
          //按钮icon
          return FloatingActionButton(
            splashColor: Colors.transparent,
            disabledElevation: 0,
            key: _fabKey,
            child: SizedBox(
              width: 24,
              height: 24,
              child: FlareActor(
                //动画文件
                'assets/flare/edit_reply.flr',
                animation: showEditAsAction ? 'ReplyToEdit' : 'EditToReply',
              ),
            ),
            backgroundColor: Color(0xFFFFBA37),
            onPressed: () {
              if (showEditAsAction) {
                Navigator.of(context).push<void>(
                  //跳转到编辑页
                  SendPage.route(context, _fabKey),
                );
              } else {
                Navigator.of(context).push<void>(
                  //跳转到编辑页
                  EditorPage.route(context, _fabKey),
                );
              }
            },
          );
        },
      ),
      //圆形变正方形放大
      builder: (BuildContext context, Widget fab) {
        final Animation<double> animation = ModalRoute.of(context).animation;
        return SizedBox(
          width: 54 * animation.value,
          height: 54 * animation.value,
          child: fab,
        );
      },
    );
  }

  Widget _scrollingList(ScrollController sc) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          height: 272,
          decoration: BoxDecoration(
            color: Color(0xFF004B6F),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 12,
                width: 24,
                margin: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width - 40) / 2
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF001E30),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),

                  MaterialButton(
                    onPressed: () {
                      Get.to(SettingPage());
                      _pc.close();
                      up = true;
                    },
                    color: Color(0xFF004B6F),
                    elevation: 0,
                    padding: EdgeInsets.only(
                      left: 0,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 24,
                        ),
                        Icon(
                          Icons.inbox,
                          size: 24,
                          color: AppTheme.on_primary,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 350,
                        ),
                        Text(
                          'Inbox',
                          style: AppTheme.menu,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(SettingPage());
                      _pc.close();
                      up = true;
                    },
                    color: Color(0xFF004B6F),
                    elevation: 0,
                    padding: EdgeInsets.only(
                      left: 0,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 24,
                        ),
                        Icon(
                          Icons.bookmarks_outlined,
                          size: 24,
                          color: AppTheme.on_primary,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 350,
                        ),
                        Text(
                          'Marked',
                          style: AppTheme.menu,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(Trash());
                      _pc.close();
                      up = true;
                    },
                    color: Color(0xFF004B6F),
                    elevation: 0,
                    padding: EdgeInsets.only(
                      left: 0,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 24,
                        ),
                        Icon(
                          Icons.delete_outline,
                          size: 24,color: AppTheme.on_primary,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 350,
                        ),
                        Text(
                          'Trash',
                          style: AppTheme.menu,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(
                        CourseManagementPage(),
                      );
                      _pc.close();
                      up = true;
                    },
                    color: Color(0xFF004B6F),
                    elevation: 0,
                    padding: EdgeInsets.only(
                      left: 0,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 24,
                        ),
                        Icon(
                          Icons.event_note_outlined,
                          size: 24,
                          color: AppTheme.on_primary,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 350,
                        ),
                        Text(
                          'Course Management',
                          style: AppTheme.menu,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.to(SettingPage());
                      _pc.close();
                      up = true;
                    },
                    color: Color(0xFF004B6F),
                    elevation: 0,
                    padding: EdgeInsets.only(
                      left: 0,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 24,
                        ),
                        Icon(
                          Icons.settings,
                          size: 24,
                          color: AppTheme.on_primary,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 350,
                        ),
                        Text(
                          'Settings',
                          style: AppTheme.menu,
                        ),
                      ],
                    ),
                  ),
                  _spacer,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<bool> _willPopCallback() async {
    if (_navigatorKey.currentState.canPop()) {
      _navigatorKey.currentState.pop();
      Provider.of<EmailModel>(context, listen: false).currentlySelectedEmailId =
          -1;
      return false;
    }
    return true;
  }

  Widget get _spacer {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 86),
      child:
      Container(width: double.infinity, height: 1, color: Color(0xFF007EB6)),
    );
  }
}
