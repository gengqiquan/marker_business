import 'dart:async';
import 'dart:io';
import 'package:marker_business/base/BaseController.dart';
import 'package:marker_business/net/Http.dart';
import 'package:marker_business/utils/User.dart';
import 'package:marker_business/widgets/LoadingView.dart';

///auther:gengqiquan
///date:2019/1/30
///description:LoginController

class RegisterMarketController with BaseController, LoadingViewController {
  String marketPhone = "";
  String marketName = "";
  String operator = "";
  String address = "";
  String scale = "";
  String operatorPhone = "";
  String logo = "";
  File logoFile;

  putInfo(Function success) {
    if (marketName.isEmpty) {
      toast("商家姓名不能为空");
      return;
    }
    if (marketPhone.length < 11) {
      toast("商家电话少于11位");
      return;
    }
    if (operator.isEmpty) {
      toast("请填写经办人");
      return;
    }
    if (marketPhone.length < 11) {
      toast("经办人联系电话少于11位");
      return;
    }
    if (address.isEmpty) {
      toast("请填写商家地址");
      return;
    }
    if (scale.isEmpty) {
      toast("请填写企业规模");
      return;
    }

    showLoading();
    putPic(logoFile, () {
      Http.instance.post("seller/sellerRegister3", {
        "sellerName": "sfsafas",
        "sellerPhone": "18005146528",
        "contracter": "fasfasfs",
        "contractPhone": "18005146528",
        "sellerAddr": address,
        "sellerScale": scale,
        "sellerLogo": logo,
      }, (model) {
        hideLoading();
        toast(model.info);
        if (model.status == 1) {
          success();
        }
      }, (e) {
        print("基本资料异常");
        netError();
        hideLoading();
      });
    });
  }

  putPic(File file, Function() success) {
    showLoading();
    Http.instance.uploadPic(file, (model) {
      hideLoading();
      if (model.status == 1) {
        logo = model.data["filepath"];
        success();
      } else {
        toast(model.info);
      }
    }, (e) {
      netError();
      hideLoading();
    });
  }
}
