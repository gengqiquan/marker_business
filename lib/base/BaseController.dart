import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///auther:gengqiquan
///date:2019/1/30
///description:LoginController

abstract class BaseController {
  updateUI(Function update) {
    var state = (this as State);
    if (state.mounted) state.setState(update);
  }

  _showToast(String msg, Toast toastLength) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  toast(String msg) {
    _showToast(msg, Toast.LENGTH_SHORT);
  }

  toastLong(String msg) {
    _showToast(msg, Toast.LENGTH_LONG);
  }

  netError() {
    _showToast("网络异常", Toast.LENGTH_LONG);
  }
}
