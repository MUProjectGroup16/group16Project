import 'package:demo/connect/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'styling.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  var flag3 = true;
  var flag4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _bluebackground,
            _whitebackground,
            _photo,
            _tab,
            _tabbar,
          ],
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
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => print(""),
                icon: const Icon(
                  Icons.menu,
                  color: AppTheme.on_primary,
                ),
              ),
              Spacer(),
              IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => Get.to(HomePage()),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppTheme.on_primary,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget get _bluebackground {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF004B6F),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
    );
  }

  Widget get _whitebackground {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.on_primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
    );
  }

  Widget get _photo {
    return Container(
      height: 56,
      width: 56,
      child: ClipOval(
        child: Image.asset("assets/images/avatar.png", fit: BoxFit.cover),
      ),
      transform: Matrix4.translationValues(16, 16, 0),
    );
  }

  Widget get _tab {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
      height: double.infinity,
      color: AppTheme.on_primary,
      child: Material(
        color: AppTheme.on_primary,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _name,
              _space,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _name {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        Global.studentId != '0' ? Global.userName1 : "tourist",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget get _space {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Container(
        width: double.infinity,
        height: 8,
        color: AppTheme.surface_variant,
      ),
    );
  }

  Widget get _spacer {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 180, 0),
      child:
          Container(width: double.infinity, height: 1, color: AppTheme.outline),
    );
  }

  Widget get _tabbar {
    return SlidingUpPanel(
      backdropColor: AppTheme.on_primary,
      minHeight: MediaQuery.of(context).size.height - 260,
      maxHeight: MediaQuery.of(context).size.height - 260,
      isDraggable: false,
      panelBuilder: (ScrollController sc) => _scrollingList(sc),
    );
  }

  Widget _scrollingList(ScrollController sc) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppTheme.on_primary,
          elevation: 0,
          title: TabBar(
            labelStyle: TextStyle(fontSize: 20),
            padding: EdgeInsets.all(0),
            indicatorColor: AppTheme.primary,

            ///控制器长度要改先不写
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: "User",
              ),
              Tab(
                text: "Course",
              ),
            ],
          ),
        ),
        body: Container(
          color: AppTheme.on_primary,
          child: TabBarView(
            children: <Widget>[
              ListView(
                padding: EdgeInsets.only(left: 16),
                children: <Widget>[
                  Text(
                    'My Roles',
                  ),
                  _spacer,
                  SizedBox(height: 20,),
                  Text('My Course'),
                  _spacer,
                ],
              ),
              ListView(children: <Widget>[
                SizedBox(
                  height: 180,
                ),
                _botton1,

                SizedBox(
                  height: 30,
                ),
                _notifications,
                _space,
                SizedBox(
                  height: 80,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget get _notifications {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Account",
              style: TextStyle(
                color: AppTheme.primary,
              ),
            ),
          ),
          _switch,
        ],
      ),
    );
  }

  Widget get _switch {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Display Email'),
              Switch(
                  value: flag3,
                  activeColor: AppTheme.primary,
                  activeTrackColor: Color(0x61006493),
                  inactiveThumbColor: Color(0xFF252525),
                  inactiveTrackColor: Color(0xFF9E9E9E),
                  onChanged: (value) {
                    setState(() {
                      flag3 = value;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Display Phone Number'),
              Switch(
                  value: flag4,
                  activeColor: AppTheme.primary,
                  activeTrackColor: Color(0x61006493),
                  inactiveThumbColor: Color(0xFF252525),
                  inactiveTrackColor: Color(0xFF9E9E9E),
                  onChanged: (value) {
                    setState(() {
                      flag4 = value;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _botton1 {
    return MaterialButton(
      onPressed: () {},
      color: AppTheme.on_primary,
      elevation: 0,
    );
  }
}
