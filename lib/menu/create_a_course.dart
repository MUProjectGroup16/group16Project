import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reply/setting_page/setting.dart';
import 'package:reply/styling.dart';
import 'package:reply/home_page.dart';
import 'course_management.dart.dart';

class CreateACoursePage extends StatefulWidget {
  const CreateACoursePage({Key key}) : super(key: key);

  @override
  State<CreateACoursePage> createState() => _CreateACourseState();
}

class _CreateACourseState extends State<CreateACoursePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController wordController = TextEditingController();
  var flag5 = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        // 触摸收起键盘
        behavior: HitTestBehavior.translucent,
        onTap: () {
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
                    _courseManagement,
                    _spacer,
                    _input,
                    _switch,
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 500,
                    ),
                    _create,
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
                onPressed: () =>  Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.home_outlined,
                  color: AppTheme.on_primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _courseManagement {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.close,
                    size: 24,
                    color: AppTheme.on_surface_variant,
                  ),
                  onPressed: () {
                    Get.to(CourseManagementPage());
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Create a Course',
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
          )
        ],
      ),
    );
  }

  Widget get _spacer {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:
          Container(width: double.infinity, height: 1, color: AppTheme.outline),
    );
  }

  Widget get _input {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                //保持label在左上角
                hintText: 'Placeholder',
                labelText: 'Class ID',
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: () {
                    nameController.clear();
                  },
                )),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: wordController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Class Name',
              border: OutlineInputBorder(),
              hintText: 'placeholder',
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  wordController.clear();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _switch {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add this account to course',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            textScaleFactor: 1.2,
          ),
          Switch(
              value: flag5,
              activeColor: AppTheme.primary,
              activeTrackColor: Color(0x61006493),
              inactiveThumbColor: Color(0xFF252525),
              inactiveTrackColor: Color(0xFF9E9E9E),
              onChanged: (value) {
                setState(() {
                  flag5 = value;
                });
              }),
        ],
      ),
    );
  }

  Widget get _create {
    return Padding(
      padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          Get.defaultDialog(
            //弹框
            backgroundColor: AppTheme.surface_3,
            content: Column(
              children: [
                Icon(
                    Icons.check,
                  color: AppTheme.on_surface,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Finished',
                  style: AppTheme.dialog_main,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'This course has been successfully added to the course list',
                  style: AppTheme.dialog,
                ),
              ],
            ),
            title: '',
            // titlePadding: EdgeInsets.only(top: 100),
            titlePadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            barrierDismissible: false,
            actions: [
              Row(
                children: [
                  SizedBox(
                    width: 220,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(CourseManagementPage());
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: AppTheme.primary),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        color: AppTheme.on_primary,
        padding: EdgeInsets.only(
          left: 0,
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.outline,
                width: 1.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.only(left: 16, right: 16),
          height: 40,
          child: Center(
            child: Text(
              'Create',
              style: AppTheme.body1,
            ),
          ),
        ),
      ),
    );
  }
}
