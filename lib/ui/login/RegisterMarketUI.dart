import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'RegisterMarketController.dart';
import 'dart:ui';
import 'dart:io';
import 'package:marker_business/ui/widgets.dart';
import 'package:marker_business/utils/Colour.dart';
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
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            "images/diwen_fp.png",
            height: 222,
            fit: BoxFit.fill,
          ),
          new Column(
            children: <Widget>[
              new Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                  children: buildIndicator(),
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
                  style: TextStyle(color: line, fontSize: 12),
                ),
              ),
              new Flexible(
                child: new SingleChildScrollView(child: buildSteps()),
              ),
            ],
          )
        ],
      ),
    );
  }

  var step = 2;
  var steps = [
    "商家注册",
    "基本资料",
    "补全证照",
    "品牌入驻",
  ];

  buildIndicator() {
    List<Widget> widgets = new List();
    steps.forEach((name) {
      var index = steps.indexOf(name) + 1;

      var dot = new Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: step >= index ? themeAccent : line,
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
            color: step > index ? Colors.white : line,
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
            style: TextStyle(color: step >= index ? Colors.white : line),
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
//                color: gray999,
//              ),
            ),
            style: TextStyle(color: gray333, fontSize: 13),
            onChanged: onChanged,
          ))
        ],
      ),
    );
  }

  buildLine() {
    return new Container(
      color: line,
      margin: EdgeInsets.only(left: 22, right: 22),
      height: 1,
    );
  }

  buildSteps() {
    var widget;
    switch (step) {
      case 2:
        widget = buildStep2();
        break;
      case 3:
        widget = buildStep3();
        break;
      case 4:
        widget = buildStep4();
        break;
    }
    return widget;
  }

  buildStep2() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildEdit("商家名称", onChanged: (str) {
          marketName = str;
        }),
        buildLine(),
        buildEdit("商家电话", inputType: TextInputType.phone, onChanged: (str) {
          marketPhone = str;
        }),
        buildLine(),
        buildEdit("经办人（联系人）", onChanged: (str) {
          operator = str;
        }),
        buildLine(),
        buildEdit("经办人（联系人）电话", inputType: TextInputType.text,
            onChanged: (str) {
          operatorPhone = str;
        }),
        buildLine(),
        buildEdit("商家地址", onChanged: (str) {
          address = str;
        }),
        buildLine(),
        buildEdit("企业规模", onChanged: (str) {
          scale = str;
        }),
        buildLine(),
        new Padding(
          padding: EdgeInsets.only(left: 34, top: 7),
          child: new Text(
            "商家LOGO",
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
        new Container(
            margin: EdgeInsets.only(left: 34, top: 7),
            width: 60,
            height: 60,
//                      decoration: new BoxDecoration(
//                          image:
//                              new DecorationImage(image: new AssetImage("images/add_pic.png"))),
            child: new InkWell(
              child: logoFile != null
                  ? new Image.file(
                      logoFile,
                      fit: BoxFit.fill,
                    )
                  : new Image.asset(
                      "images/add_pic.png",
                      fit: BoxFit.fill,
                    ),
              onTap: () async {
                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  logoFile = image;
                });
              },
            )),
        new Padding(
          padding: EdgeInsets.only(left: 48, right: 48, top: 20, bottom: 20),
          child: new Button("下一步", () {
            putInfo(() {
              setState(() {
                step = 3;
              });
            });
          }),
        ),
      ],
    );
  }

  buildStep3() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(left: 34, top: 12),
          child: new Text(
            "营业执照",
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
        new Container(
            margin: EdgeInsets.only(left: 34, top: 15),
            width: 110,
            height: 80,
            child: new InkWell(
              child: file1 != null
                  ? new Image.file(
                      file1,
                      fit: BoxFit.fill,
                    )
                  : new Image.asset(
                      "images/yingyezhizhao.png",
                      fit: BoxFit.fill,
                    ),
              onTap: () async {
                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  file1 = image;
                });
              },
            )),
        new Padding(
          padding: EdgeInsets.only(left: 34, top: 15),
          child: new Text(
            "经办人（联系人）身份证",
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
                margin: EdgeInsets.only(left: 34, top: 15),
                width: 110,
                height: 80,
                child: new InkWell(
                  child: file2 != null
                      ? new Image.file(
                          file2,
                          fit: BoxFit.fill,
                        )
                      : new Image.asset(
                          "images/identity1.png",
                          fit: BoxFit.fill,
                        ),
                  onTap: () async {
                    var image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      file2 = image;
                    });
                  },
                )),
            new Container(
                margin: EdgeInsets.only(right: 34, top: 15),
                width: 110,
                height: 80,
                child: new InkWell(
                  child: file3 != null
                      ? new Image.file(
                          file3,
                          fit: BoxFit.fill,
                        )
                      : new Image.asset(
                          "images/identity2.png",
                          fit: BoxFit.fill,
                        ),
                  onTap: () async {
                    var image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      file3 = image;
                    });
                  },
                )),
          ],
        ),
        new Padding(
          padding: EdgeInsets.only(left: 34, top: 12),
          child: new Text(
            "法人授权书",
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
        new Container(
            margin: EdgeInsets.only(left: 34, top: 15),
            width: 110,
            height: 80,
            child: new InkWell(
              child: file4 != null
                  ? new Image.file(
                      file4,
                      fit: BoxFit.fill,
                    )
                  : new Image.asset(
                      "images/authorize.png",
                      fit: BoxFit.fill,
                    ),
              onTap: () async {
                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  file4 = image;
                });
              },
            )),
        new Padding(
          padding: EdgeInsets.only(left: 48, right: 48, top: 20, bottom: 20),
          child: new Button("下一步", () {
            putPics(() {
              setState(() {
                step = 4;
              });
            });
          }),
        ),
      ],
    );
  }

  buildStep4() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildEdit("商品名称", onChanged: (str) {
          marketName = str;
        }),
        buildLine(),
        new Padding(
          padding: EdgeInsets.only(left: 34, top: 7),
          child: new Text(
            "品牌授权书",
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
        buildLine(),
        new Container(
            margin: EdgeInsets.only(left: 34, top: 7),
            width: 60,
            height: 60,
//                      decoration: new BoxDecoration(
//                          image:
//                              new DecorationImage(image: new AssetImage("images/add_pic.png"))),
            child: new InkWell(
              child: logoFile != null
                  ? new Image.file(
                      logoFile,
                      fit: BoxFit.fill,
                    )
                  : new Image.asset(
                      "images/add_pic.png",
                      fit: BoxFit.fill,
                    ),
              onTap: () async {
                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  logoFile = image;
                });
              },
            )),
        new Padding(
          padding: EdgeInsets.only(left: 48, right: 48, top: 20, bottom: 20),
          child: new Button("提交审核", () {
            putInfo(() {
              setState(() {
                step = 3;
              });
            });
          }),
        ),
      ],
    );
  }
}
