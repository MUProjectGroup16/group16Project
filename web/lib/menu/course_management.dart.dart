import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reply/setting_page/setting.dart';
import 'package:reply/styling.dart';
import 'package:reply/home_page.dart';
import 'Manage_My_Courses.dart';
import 'create_a_course.dart';
import 'edit_courses.dart';

class CourseManagementPage extends StatefulWidget {
  const CourseManagementPage({Key key}) : super(key: key);

  @override
  State<CourseManagementPage> createState() => _CourseManagementState();
}

class _CourseManagementState extends State<CourseManagementPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
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
                  _manageMyCourses,
                  _createCourses,
                  _editCourses,
                ],
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
                onPressed: () => Get.to(HomePage()),
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
              onPressed: () => Get.to(HomePage()),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Course Management',
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
        ))
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

Widget get _manageMyCourses {
  return Container(
    child: Column(
      children: <Widget>[
        MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Get.to(ManagePage());
            },
            color: AppTheme.on_primary,
            elevation: 0,
            highlightElevation: 0,
            child: Container(
              height: 40,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Manage My Courses',
                    style: AppTheme.body1,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: AppTheme.on_surface_variant,
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget get _createCourses {
  return Container(
    child: Column(
      children: <Widget>[
        MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            onPressed: () => Get.to(CreateACoursePage()),
            color: AppTheme.on_primary,
            child: Container(
              height: 40,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create Courses',
                    style: AppTheme.body1,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: AppTheme.on_surface_variant,
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget get _editCourses {
  return Container(
    child: Column(
      children: <Widget>[
        MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => Get.to(EditCoursesPage()),
            color: AppTheme.on_primary,
            elevation: 0,
            highlightElevation: 0,
            child: Container(
              height: 40,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Courses',
                    style: AppTheme.body1,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: AppTheme.on_surface_variant,
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}
