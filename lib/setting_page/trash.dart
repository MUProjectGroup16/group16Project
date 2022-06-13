import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/styling.dart';
import 'package:demo/connect/dio5.dart';


class Trash extends StatefulWidget {
  const Trash({Key key}) : super(key: key);

  @override
  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        alignment: Alignment.bottomCenter,
        children: [
          dio5(),
         Container(
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
        ],
      ),
    );
  }
}
