import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///auther:gengqiquan
///date:2019/1/30
///description:MsgUI

class MsgUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MsgUIState();
}

class _MsgUIState extends State<MsgUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//      navigationBar: new CupertinoNavigationBar(
//        middle: const Text("消息"),
//      ),
      body: new Container(color: Colors.yellow,),
    );
  }
}