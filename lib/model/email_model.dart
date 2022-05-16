import 'package:flutter/widgets.dart';

import 'email.dart';

class EmailModel with ChangeNotifier {

  final List<Email> _emails = <Email>[
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", true, false, false),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", true, false, false),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, false),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, true),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, true),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", true, false, true),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, false),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, false),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, false),
    Email("rubbish front end engineer", "long long ago", "大本钟下送快递", "我今天不写了，是在写不动了，易书行这是要挂路灯的，list内容路由要传递九个值，后端组加油", "avatar.png", "易书行", false, false, false),

  ];

  int _currentlySelectedEmailId = -1;

  List<Email> get emails => List<Email>.unmodifiable(_emails);

  void deleteEmail(int id) {
    _emails.removeAt(id);
    notifyListeners();
  }

  int get currentlySelectedEmailId => _currentlySelectedEmailId;

  set currentlySelectedEmailId(int value) {
    _currentlySelectedEmailId = value;
    notifyListeners();
  }


}
