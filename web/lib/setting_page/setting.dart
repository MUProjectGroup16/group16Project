import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/transition/fab_fill_transition.dart';
import 'package:demo/styling.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var flag1 = true;
  var flag2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Container(
            height: double.infinity,
            child: Material(
              color: AppTheme.on_primary,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _subjectRow,
                    _spacer,
                    _Account,
                    _name,
                    _box,
                    _email,
                    _box,
                    _id,
                    _setList,
                    _spacer,
                    _notifications,
                    _spacer,
                    _general,
                    _version,
                    _logout,
                  ],
                ),
              ),
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
                  onPressed: () => print(""),
                  icon: const Icon(
                    Icons.home_outlined,
                    color: AppTheme.on_primary,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget get _spacer {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(width: double.infinity, height: 1, color: AppTheme.outline),
    );
  }

  Widget get _box {
    return SizedBox(
      height: 16,
    );
  }

  Widget get _subjectRow {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: AppTheme.on_surface_variant,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                  "Settings",
                  style: AppTheme.subhead1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _Account {
    return Padding(
      padding: EdgeInsets.only(top: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              "Account",
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 16,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _name {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 32, top: 4,bottom: 4),
          child: Text(
            "Name",
            style: AppTheme.body1,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
          child: TextField(
            textAlign: TextAlign.end,
            decoration: InputDecoration.collapsed(
                hintText: "ysx"
            ),
          ),
        ),
        SizedBox(
          width: 32,
        ),
      ],
    );
  }

  Widget get _email {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 32, top: 4,bottom: 4),
          child: Text(
            "Email",
            style: AppTheme.body1,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
          child: TextField(
            textAlign: TextAlign.end,
            decoration: InputDecoration.collapsed(
                hintText: "ysx"
            ),
          ),
        ),
        SizedBox(
          width: 32,
        ),
      ],
    );
  }

  Widget get _id {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 32, top: 4,bottom: 4),
          child: Text(
            "Student ID",
            style: AppTheme.body1,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Flexible(
          child: TextField(
            textAlign: TextAlign.end,
            decoration: InputDecoration.collapsed(
                hintText: "ysx"
            ),
          ),
        ),
        SizedBox(
          width: 32,
        ),
      ],
    );
  }

  Widget get _setList {
    return Container(
      padding: EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Column(
        children: <Widget>[
          MaterialButton(
              onPressed: () {},
              color: AppTheme.on_primary,
              elevation: 0,
              highlightElevation: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password',
                      style: AppTheme.body1,
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget get _notifications {
    return Padding(
      padding: EdgeInsets.only(top: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              "Notifications",
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 16,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w500,
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
      padding: EdgeInsets.only(
        left: 32,
        top: 4,
        right: 16,
        bottom: 4,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Allow Notifications',
                style: AppTheme.body1,
              ),
              Switch(
                  value: flag1,
                  activeColor: AppTheme.primary,
                  activeTrackColor: Color(0x61006493),
                  inactiveThumbColor: Color(0xFF252525),
                  inactiveTrackColor: Color(0xFF9E9E9E),
                  onChanged: (value) {
                    setState(() {
                      flag1 = value;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Show Preview Text',
                style: AppTheme.body1,
              ),
              Switch(
                  value: flag2,
                  activeColor: AppTheme.primary,
                  activeTrackColor: Color(0x61006493),
                  inactiveThumbColor: Color(0xFF252525),
                  inactiveTrackColor: Color(0xFF9E9E9E),
                  onChanged: (value) {
                    setState(() {
                      flag2 = value;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _general {
    return Padding(
      padding: EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              "General",
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 16,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _version {
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        bottom: 8,
        left: 32,
        right: 32,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Version',
                style: AppTheme.body1,
              ),
              Text(
                '1.0.0',
                style: AppTheme.body1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _logout {
    return Container(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {},
            color: AppTheme.on_primary,
            elevation: 0,
            highlightElevation: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            // child: Container(
            //   height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Log Out',
                    style: AppTheme.body1_red,
                  ),
                  Icon(Icons.exit_to_app),
                ],
              ),
            ),
          // ),
        ],
      ),
    );
  }
}
