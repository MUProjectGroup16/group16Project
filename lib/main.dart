import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply/home_page.dart';
import 'package:reply/menu/class_model.dart';
import 'package:reply/model/email_model.dart';
import 'package:reply/styling.dart';
import 'package:get/get.dart';
import 'connect/Global.dart';
import 'login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmailModel>.value(value: EmailModel()),
        ChangeNotifierProvider<classModel>.value(value: classModel()),
      ],
      child: GetMaterialApp(
        title: 'Reply',
        theme: ThemeData(
          scaffoldBackgroundColor: AppTheme.on_primary,
          canvasColor: AppTheme.on_primary,
          // accentColor: AppTheme.orange,
        ),
        //主题
        home: Global.userId == '0'? LoginPage() : HomePage(),
      ),
    );
    //状态管理 provider
  }
}
