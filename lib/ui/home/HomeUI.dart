import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///auther:gengqiquan
///date:2019/1/30
///description:HomeUI

class HomeUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
//      navigationBar: new CupertinoNavigationBar(
//        middle: const Text("首页"),
//      ),
      child: new Container(color: Colors.yellow,),
    );
  }
}