import 'package:flutter/material.dart';
import 'package:reply/styling.dart';
import 'package:get/route_manager.dart';
import 'package:reply/home_page.dart';


class PasswordPage extends StatefulWidget {
  const PasswordPage({Key key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _CreateACourseState();
}

class _CreateACourseState extends State<PasswordPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController wordController = TextEditingController();

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
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 500,
                    ),
                    _delete,
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
                    onPressed: () =>  Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Setting',
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

  Widget get _delete {
    return MaterialButton(
      onPressed: () {
        Get.defaultDialog(
          backgroundColor: AppTheme.surface_3,
          //弹框
          content: Column(
            children: [
              Icon(
                Icons.error_outline,
                color: AppTheme.on_surface,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Delete?',
                style: AppTheme.dialog_main,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'This course will be permanently deleted and cannot be retrieved',
                style: AppTheme.dialog,
              ),
            ],
          ),
          title: '',
          // titlePadding: EdgeInsets.only(top: 100),
          titlePadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          barrierDismissible: false,
          actions: [
            Row(
              children: [
                SizedBox(
                  width: 150,
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(color: AppTheme.error),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      color: AppTheme.on_primary,
      elevation: 0,
      highlightElevation: 0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
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
            style: TextStyle(color: Colors.black) ,
          ),
        ),
      ),
    );
  }

}
