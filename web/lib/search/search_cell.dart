import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reply/search/search bar.dart';
import 'search bar.dart';

class SearchCell extends StatelessWidget {
  const SearchCell({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => {
        Get.to(SearchPage(),)
      },
      child: Container(
        height: 80,
        width: 200,
        color: Colors.lightBlue,
        padding: EdgeInsets.only(bottom: 5),
        margin: EdgeInsets.all(2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(),
              ),
            ), //白底
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.search),
                Text(
                  '    search',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
