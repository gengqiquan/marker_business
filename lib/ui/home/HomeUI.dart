import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marker_business/ui/product/AddProductUI.dart';
import 'package:marker_business/utils/Colour.dart';

///auther:gengqiquan
///date:2019/1/30
///description:HomeUI

class HomeUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      navigationBar: new CupertinoNavigationBar(
//        middle: const Text("首页"),
//      ),
    key:scaffoldKey ,
      body: new Container(
          color: back,
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
                          buildButton("images/add_product.png", "添加商品", () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>new AddProductUI()));
                          }),
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
                  "推广活动",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              new Divider(
                height: 0.5,
              ),
              new Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buildButton2("images/ad.png", "线下广告引流", () {

                    }),
                    buildButton2("images/free.png", "线上免费活动", () {}),
                  ],
                ),
              ),
              new Container(
                height: 50,
                padding: EdgeInsets.only(left: 34),
                alignment: Alignment.centerLeft,
                color: Colors.white,
                width: double.infinity,
                child: new Text(
                  "商品管理",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              new Divider(
                height: 0.5,
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buildButton2("images/store.png", "商品库", () {}),
                    buildButton2("images/saling.png", "在架商品", () {}),
                    buildButton2("images/act.png", "活动商品", () {}),
                  ],
                ),
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
          onTap: onTap,
    ));
  }

  buildButton2(String path, String text, Function onTap) {
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
            style: TextStyle(color: Colors.black, fontSize: 14),
          )
        ],
      ),
    ));
  }

//  buildItem(BuildContext context, int index) {
//    var item = list[index];
//    return new InkWell(
//        child: new Column(
////      crossAxisAlignment: CrossAxisAlignment.center,
//      children: <Widget>[
//        new Image.asset(
//          item["path"],
//          width: 39,
//          height: 39,
//        ),
//        new Padding(padding: EdgeInsets.only(top: 11)),
//        new Text(
//          item["text"],
//          style: TextStyle(color: Colors.black, fontSize: 16),
//        )
//      ],
//    ));
//  }


}