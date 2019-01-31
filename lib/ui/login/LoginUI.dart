import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'LoginController.dart';
import 'dart:ui';
import 'package:marker_business/widgets/LoadingView.dart';
import 'package:marker_business/utils/Colour.dart';
import 'package:marker_business/widgets/EnsureVisibleWhenFocused.dart';
import 'package:flutter/services.dart';
import 'RegisterUI.dart';
import 'package:marker_business/utils/User.dart';
import 'package:marker_business/base/BaseController.dart';
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
    with LoginController,BaseController, LoadingViewController {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text("登录",style: TextStyle(color: Colour.gray666,fontWeight: FontWeight.w100),)),
      body: new Container(
        color: Colors.white,
        height: double.infinity,
        padding:
            EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
        child: new Stack(
          children: <Widget>[
            Positioned(
              child: new Image.asset("images/zhuangshi.png"),
              bottom: 0,
            ),
            new SingleChildScrollView(
              padding: EdgeInsets.only(left: 48, top: 20, right: 48),
              child: new Column(
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
                    height: 50,
                  ),
                  new Container(
                      width: double.infinity,
                      height: 48,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colour.themeAccent15,
                          border: Border.all(color: Colour.line, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.person_outline,
                            color: Colour.themeAccent,
                          ),
                          new Flexible(
                              child: new EnsureVisibleWhenFocused(
                                  focusNode: new FocusNode(),
                                  builder: (focusNode, controller) {
                                    return new TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(11)
                                      ],
                                      keyboardType: TextInputType.phone,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "请输入您的手机号码",
                                        hintStyle:
                                            TextStyle(color: Colour.gray999),
                                      ),
                                      style: TextStyle(
                                          color: Colour.gray333, fontSize: 14),
                                      onChanged: (str) {
                                        phone = str;
                                      },
                                    );
                                  }))
                        ],
                      )),
                  new SizedBox(
                    height: 18,
                  ),
                  new Container(
                      width: double.infinity,
                      height: 48,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colour.themeAccent15,
                          border: Border.all(color: Colour.line, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.lock_open,
                            color: Colour.themeAccent,
                          ),
                          new Flexible(
                              child: new EnsureVisibleWhenFocused(
                                  focusNode: new FocusNode(),
                                  builder: (focusNode, controller) {
                                    return new TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(6)
                                      ],
                                      maxLengthEnforced: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "请输入短信验证码",
                                        hintStyle:
                                            TextStyle(color: Colour.gray999),
                                      ),
                                      style: TextStyle(
                                          color: Colour.gray333, fontSize: 14),
                                      onChanged: (str) {
                                        code = str;
                                      },
                                    );
                                  })),
//                          new Spacer(),
                          new InkWell(
                            enableFeedback: codeEnable,
                            child: new Text(
                              codeEnable ? "获取验证码" : codeTime,
                              style: TextStyle(
                                  color: codeEnable
                                      ? Colour.themeAccentE0
                                      : Colour.gray999,
                                  fontSize: 14),
                            ),
                            onTap: () {
                              getCode();
                            },
                          )
                        ],
                      )),
                  new SizedBox(
                    height: 18,
                  ),
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
                      login(() {
                        hideLoading();
                        widget.loginSuccess();
                      });
                    },
                  ),
                  new SizedBox(
                    height: 25,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        "没有账号？",
                        style: TextStyle(color: Colour.gray999, fontSize: 14),
                      ),
                      new InkWell(
                        child: new Text(
                          "去注册",
                          style: TextStyle(
                              color: Colour.themeAccentE0, fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => RegisterUI(
                                    loginSuccess: widget.loginSuccess,
                                  )));
                        },
                      ),
                      new SizedBox(
                        width: 25,
                      ),
                    ],
                  )
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
