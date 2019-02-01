import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///auther:gengqiquan
///date:2019/1/30
///description:UserUI

class UserUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _UserUIState();
}

class _UserUIState extends State<UserUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//      navigationBar: new CupertinoNavigationBar(
//        middle: const Text("用户"),
//      ),
      body: new Container(color: Colors.green,),
    );
  }
}
