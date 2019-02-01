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
  File file1;
  File file2;
  File file3;
  File file4;

  putPics(Function success) {
    if (file1 == null) {
      toast("请上传营业执照");
      return;
    }
    if (file2 == null) {
      toast("请上传经办人（联系人）身份证");
      return;
    }
    if (file3 == null) {
      toast("请上传经办人（联系人）身份证");
      return;
    }
    if (file4 == null) {
      toast("请上传法人授权书");
      return;
    }
    Map pics = {
      file1: null,
      file2: null,
      file3: null,
      file4: null,
    };
    var done = true;
    while (done) {
      pics.forEach((key, v) {
        uploadPic(key, (path) {
          pics[key] = path;
          if (!pics.containsValue(null)) {
            done = false;
            putCredentials(pics, success);
          }
        });
      });
    }
  }

  putCredentials(Map pics, Function success) {
    Http.instance.post("seller/sellerRegister4", {
      "businessLicense": pics[file1],
      "idCardFront": pics[file2],
      "idCardOpposite": pics[file3],
      "powerAttorney": pics[file4],
    }, (model) {
      hideLoading();
      toast(model.info);
      if (model.status == 1) {
        success();
      }
    }, (e) {
      toast("证件上传异常");
      netError();
      hideLoading();
    });
  }

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

    if (logoFile != null) {
      uploadPic(logoFile, (path) {
        logo = path;
        uploadInfo(success);
      });
    } else {
      uploadInfo(success);
    }
  }

  uploadInfo(Function success) {
    Http.instance.post("seller/sellerRegister3", {
      "sellerName": marketName,
      "sellerPhone": marketPhone,
      "contracter": operator,
      "contractPhone": operatorPhone,
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
      toast("资料上传异常");
      netError();
      hideLoading();
    });
  }

  uploadPic(File file, Function(String) success) {
    showLoading();
    Http.instance.uploadPic(file, (model) {
      hideLoading();
      if (model.status == 1) {
        var path = model.data["filepath"];
        success(path);
      } else {
        toast(model.info);
      }
    }, (e) {
      netError();
      hideLoading();
    });
  }
}
