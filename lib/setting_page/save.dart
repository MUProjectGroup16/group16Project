import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/styling.dart';
import 'package:demo/connect/dio6.dart';


class Save extends StatefulWidget {
  const Save({Key key}) : super(key: key);

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:dio6(),
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
}
