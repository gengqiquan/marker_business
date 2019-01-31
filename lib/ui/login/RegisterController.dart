import 'package:flutter/material.dart';
import 'package:marker_business/base/BaseController.dart';
import 'dart:async';
import 'package:marker_business/widgets/LoadingView.dart';
import 'package:marker_business/net/Http.dart';

///auther:gengqiquan
///date:2019/1/30
///description:LoginController

class RegistController with BaseController, LoadingViewController {
  String phone="";
  String code="";
  String codeTime = "120s后再试";
  bool codeEnable = true;

  getCode() {
    if (phone.length < 11) {
      toast("手机号码少于11位");
      return;
    }
    showLoading();

    Http.instance.post("seller/sendVerifCode", {"phoneNum": phone}, (model) {
      if (model.status == 1) {
        hideLoading();
        toast("验证码发送成功");
        cutDown();
      } else {
        toast(model.info);
      }
    }, (e) {
      netError();
      hideLoading();
    });
  }

  register(Function success) {
    if (code.length < 4) {
      toast("请输入正确验证码");
      return;
    }
    showLoading();

    Http.instance.post(
        "seller/sellerRegister1", {"phone": phone, "code": code}, (model) {
      hideLoading();
      if (model.status == 1) {
        toast("登录成功");
        success();
      } else {
        toast(model.info);
      }
    }, (e) {
      netError();
      hideLoading();
    });
  }

  cutDown() {
    print("开始倒计时");

    updateUI(() {
      codeTime = "120s后再试";
      codeEnable = false;
    });
    Timer.periodic(new Duration(seconds: 1), (timer) {
      var now = 120 - timer.tick;
      if (now <= 0) {
        updateUI(() {
          codeEnable = true;
        });
        timer.cancel();

        print("倒计时结束");
        return;
      }
      updateUI(() {
        codeTime = "${now}s后再试";
      });
    });
  }
}
