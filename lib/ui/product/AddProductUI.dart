import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:marker_business/ui/widgets.dart';
import 'package:marker_business/ui/ui.dart';
import 'package:flutter/services.dart';

///auther:gengqiquan
///date:2019/2/11
///description:AddProductUI

class AddProductUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddProductUIState();
}

const labelStyle = TextStyle(fontSize: 14, color: gray444);
const hintStyle = TextStyle(fontSize: 14, color: gray999);

class _AddProductUIState extends State<AddProductUI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new TitleBar("添加商品"),
      body: new Scrollable(
          viewportBuilder: (context, b) => new Column(
                children: <Widget>[
                  new Container(
                    color: white,
                    child: new Column(
                      children: <Widget>[
                        buildEdit("商品条码", "如无条码系统自动生成编号", onChanged: (str) {}),
                        buildEdit("商品名称", "请输入商品名称", onChanged: (str) {}),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }

  buildEdit(String label, String hintText,
      {int maxLength = 11,
      TextInputType inputType = TextInputType.text,
      Function(String) onChanged}) {
    return new Container(
      color: white,
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 44,
      alignment: Alignment.center,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            label,
            style: labelStyle,
          ),
          new Padding(padding: EdgeInsets.only(left: 15)),
          new Flexible(
              child: new TextField(
//                    controller: controller,
//                    focusNode: focusNode,
            inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
            keyboardType: inputType,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle,
            ),
            style: labelStyle,
            onChanged: onChanged,
          ))
        ],
      ),
    );
  }
}
