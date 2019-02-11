import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

///auther:gengqiquan
///date:2019/2/11
///description:TitleBar

class TitleBar extends StatelessWidget implements PreferredSize {
  final String title;

  const TitleBar(this.title,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  // TODO: implement child
  Widget get child => new Container(
        decoration: new BoxDecoration(
            color: Colors.black,
            image: new DecorationImage(
                fit: BoxFit.fitWidth,
                image: new AssetImage(
                  "images/diwen_fp.png",
                ))),
        child: new AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: new Text(title),
        ),
      );

  @override
  Size get preferredSize => new AppBar().preferredSize;
}
