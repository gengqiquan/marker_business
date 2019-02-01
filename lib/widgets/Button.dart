import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:marker_business/utils/Colour.dart';

///auther:gengqiquan
///date:2019/2/1
///description:Button主题按钮

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        child: new Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        decoration: BoxDecoration(
            color: Colour.themeAccent,
            borderRadius: BorderRadius.all(Radius.circular(24))),
      ),
      onTap: onTap,
    );
  }

  Button(this.text, this.onTap);

  final String text;
  final Function() onTap;
}
