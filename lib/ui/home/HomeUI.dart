import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marker_business/ui/login/RegisterMarketUI.dart';
import 'package:marker_business/utils/Colour.dart';

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
    return new Scaffold(
//      navigationBar: new CupertinoNavigationBar(
//        middle: const Text("首页"),
//      ),
      body: new Container(
          color: Colour.back,
          child: new Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Image.asset(
                    "images/diwen_fp.png",
                    height: 180,
                    fit: BoxFit.fill,
                  ),
                  new Column(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + 48)),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          buildButton("images/add_product.png", "添加商品", () {}),
                          buildButton("images/putaway.png", "商品上架", () {}),
                          buildButton("images/order.png", "订单管理", () {}),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new Container(
                height: 50,
                padding: EdgeInsets.only(left: 34),
                alignment: Alignment.centerLeft,
                color: Colors.white,
                width: double.infinity,
                child: new Text(
                  "客户管理",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              new Divider(
                height: 0.5,
              ),
              new Row(
                children: <Widget>[
                  buildButton("images/add_product.png", "添加商品", () {}),
                  buildButton("images/putaway.png", "商品上架", () {}),
                  buildButton("images/order.png", "订单管理", () {}),
                ],
              ),
              new Container(
                color: Colors.white,
                child: new GridView.builder(
                  shrinkWrap: true,
                    itemCount: list.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) => buildItem(context, index)),
              ),
            ],
          )),
    );
  }

  buildButton(String path, String text, Function onTap) {
    return new Flexible(
        child: new InkWell(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            path,
            width: 39,
            height: 39,
          ),
          new Padding(padding: EdgeInsets.only(top: 11)),
          new Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    ));
  }

  buildItem(BuildContext context, int index) {
    var item = list[index];
    return new InkWell(
        child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Image.asset(
          item["path"],
          width: 39,
          height: 39,
        ),
        new Padding(padding: EdgeInsets.only(top: 11)),
        new Text(
          item["text"],
          style: TextStyle(color: Colors.black, fontSize: 16),
        )
      ],
    ));
  }

  List list = [
    {"path": "images/product.png", "text": "体验客户"},
    {"path": "images/product.png", "text": "购买客户"},
    {"path": "images/product.png", "text": "分销代理"},
    {"path": "images/product.png", "text": "特权设置"},
    {"path": "images/product.png", "text": "客户评论"},
  ];
}
