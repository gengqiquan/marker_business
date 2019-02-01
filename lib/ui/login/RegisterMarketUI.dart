import 'package:flutter/material.dart';
import 'RegisterMarketController.dart';
import 'dart:ui';
import 'dart:io';
import 'package:marker_business/widgets/LoadingView.dart';
import 'package:marker_business/utils/Colour.dart';
import 'package:marker_business/widgets/EnsureVisibleWhenFocused.dart';
import 'package:flutter/services.dart';
import 'package:marker_business/base/BaseController.dart';
import 'package:image_picker/image_picker.dart';

///auther:gengqiquan
///date:2019/1/31
///description:RegisterMarketUI

class RegisterMarketUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RegisterMarketUIState();
}

class _RegisterMarketUIState extends State<RegisterMarketUI>
    with RegisterMarketController, LoadingViewController, BaseController {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Image.asset(
                "images/diwen_fp.png",
                height: 222,
                fit: BoxFit.fill,
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    alignment: Alignment.bottomCenter,
                    height: 48,
                    child: new Row(
                      children: <Widget>[
                        new IconButton(
                            icon: new Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        Text(
                          "商家免费入住",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        new IconButton(
                            icon: new Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(34, 10, 34, 15),
                    child: new Row(
                      children: buildStep(),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: buildStepLabel(),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: new Text(
                      "提交入驻申请后，我们会在3个工作日内给出审核结果；如有疑问，请点击右上角联系客服",
                      style: TextStyle(color: Colour.line, fontSize: 12),
                    ),
                  ),
                  buildEdit("商家名称", onChanged: (str) {
                    marketName = str;
                  }),
                  line(),
                  buildEdit("商家电话", onChanged: (str) {
                    marketPhone = str;
                  }),
                  line(),
                  buildEdit("经办人（联系人）", onChanged: (str) {
                    operator = str;
                  }),
                  line(),
                  buildEdit("经办人（联系人）电话", onChanged: (str) {
                    operatorPhone = str;
                  }),
                  line(),
                  buildEdit("商家地址", onChanged: (str) {
                    address = str;
                  }),
                  line(),
                  buildEdit("企业规模", onChanged: (str) {
                    scale = str;
                  }),
                  line(),
                  new Text(
                    "上海LOGO",
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  new Container(
                      width: 120,
                      height: 120,
                      decoration: new BoxDecoration(
                          image:
                              new DecorationImage(image: new AssetImage("images/add_pic.png"))),
                      child: new InkWell(
                        child: new Image.file(logoFile),
                        onTap: () async {
                          var image = await ImagePicker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            logoFile = image;
                          });
                        },
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  File logoFile;
  var step = 2;
  var steps = [
    "商家注册",
    "基本资料",
    "补全证照",
    "品牌入驻",
  ];

  buildStep() {
    List<Widget> widgets = new List();
    steps.forEach((name) {
      var index = steps.indexOf(name) + 1;

      var dot = new Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: step >= index ? Colour.themeAccent : Colour.line,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: new Text(
          index.toString(),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );

      widgets.add(index == step
          ? new Container(
              child: dot,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            )
          : dot);
      if (index != 4) {
        widgets.add(new Flexible(
          flex: 1,
          child: new Container(
            color: step > index ? Colors.white : Colour.line,
            height: 2,
          ),
        ));
      }
    });
    return widgets;
  }

  buildStepLabel() {
    List<Widget> widgets = new List();
    steps.forEach((name) {
      var index = steps.indexOf(name) + 1;
      widgets.add(new Flexible(
        flex: 1,
        child: new Container(
//          alignment: Alignment.center,
//          width: double.infinity,
          child: new Text(
            name,
            style: TextStyle(color: step >= index ? Colors.white : Colour.line),
          ),
        ),
      ));
    });
    return widgets;
  }

  buildEdit(String label,
      {int maxLength = 11,
      TextInputType inputType = TextInputType.text,
      Function(String) onChanged}) {
    return new Container(
      margin: EdgeInsets.only(left: 34, right: 34),
      height: 44,
      alignment: Alignment.center,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 13),
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
//              hintText: "请输入商家名称",
//              hintStyle: TextStyle(
//                color: Colour.gray999,
//              ),
            ),
            style: TextStyle(color: Colour.gray333, fontSize: 13),
            onChanged: onChanged,
          ))
        ],
      ),
    );
  }

  line() {
    return new Container(
      color: Colour.line,
      margin: EdgeInsets.only(left: 22, right: 22),
      height: 1,
    );
  }
}
