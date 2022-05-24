import 'package:flutter/material.dart';
import 'package:demo/styling.dart';
import 'package:demo/ui/rounded_avatar.dart';

import '../menu/class.dart';

// class ClassItem extends StatefulWidget {
//   const ClassItem({Key key, this.Classes}) : super(key: key);
//   final classes Classes;
//
//   @override
//   State<ClassItem> createState() => _ClassItemState();
// }
//
// class _ClassItemState extends State<ClassItem> {
//   classes Classes;
//
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       title: Text( '${Classes.id} — ${Classes.name}',),
//       subtitle: Text(Classes.time),
//       value: Classes.ischoose,
//       onChanged: (bool value) {
//         setState(() {
//           Classes.ischoose != value;
//         });
//       },
//     );
//
//   }
// }

class ClassItem extends StatelessWidget {
  ClassItem({Key key, this.Classes,this.id}) : super(key: key);
  final classes Classes;
  final int id;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text('${Classes.id} — ${Classes.name}',),
      subtitle: Text(Classes.time),
      value: Classes.ischoose,
      onChanged: (bool value) {
        Classes.ischoose == value;
      },
    );
  }
}
