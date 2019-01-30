import 'package:flutter/material.dart';
import 'LoginController.dart';
import 'dart:ui';
import 'package:marker_business/widgets/LoadingView.dart';
import 'package:marker_business/utils/Colour.dart';
import 'package:marker_business/widgets/EnsureVisibleWhenFocused.dart';
///auther:gengqiquan
///date:2019/1/30
///description:LoginUI

class LoginUI extends StatefulWidget {
  Function loginSuccess;

  @override
  State<StatefulWidget> createState() => new _LoginUIState();

  LoginUI({@required this.loginSuccess});
}

class _LoginUIState extends State<LoginUI>
    with LoginController, LoadController {
//  var loading = true;
  FocusNode _focusNodeFirstName = new FocusNode();
  static final TextEditingController _firstNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(""),
      ),
      body: new Container(
        color: Colors.white,
        padding:
            EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
        child: new Stack(
          children: <Widget>[
            new SingleChildScrollView(
              padding:  EdgeInsets.only(left: 48, top: 111, right: 48),
              child:new Column(
                children: <Widget>[
                  new Image.asset("images/logo.png"),
                  new SizedBox(
                    height: 16,
                  ),
                  new Text(
                    "一家专注品牌推广的电商平台",
                    style: TextStyle(color: Colour.themeAccent, fontSize: 16),
                  ),
                  new SizedBox(
                    height: 100,
                  ),
                  new Container(
                    width: double.infinity,
                    height: 48,
                    alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          border: Border.all(color:  Colour.line, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                    child:new EnsureVisibleWhenFocused(
                      focusNode: _focusNodeFirstName,
                      child: new TextField(
                        controller: _firstNameController,
                        focusNode: _focusNodeFirstName,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "请输入您的手机号码",
                          hintStyle: TextStyle(color: Colour.gray999),
                          prefixIcon: new Icon(
                            Icons.person,
                            color: Colour.themeAccent,
                          )),
                      style: TextStyle(color: Colour.gray333, fontSize: 14),
                    ),

                    )),
                  new InkWell(
                    child: new Container(
                      width: double.infinity,
                      height: 48,
                      alignment: Alignment.center,
                      child: new Text(
                        "登录",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      decoration: BoxDecoration(
                          color: Colour.themeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                    ),
                    onTap: () {
                      showLoading();
                      login(() {
                        hideLoading();
                        widget.loginSuccess();
                      });
                    },
                  ),
                ],
              ),
            ),
            new LoadingView(state: loading),
          ],
        ),
      ),
    );
  }
}
