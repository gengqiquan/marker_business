import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:marker_business/ui/widgets.dart';
import 'package:marker_business/utils/Colour.dart';

///auther:gengqiquan
///date:2019/2/11
///description:AddProductUI

class AddProductUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddProductUIState();
}

const labelStyle = TextStyle(fontSize: 14, color: gray444);
const hintStyle = TextStyle(fontSize: 14, color: gray999);
const white = Colors.white;

class _AddProductUIState extends State<AddProductUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new TitleBar("添加商品"),
      body: new CustomScrollView(
        slivers: <Widget>[
          new Container(
            color: white,
            child: new Row(
              children: <Widget>[
                new Text(
                  "商品条码",
                  style: labelStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
