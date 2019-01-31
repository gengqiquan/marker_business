import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:marker_business/entity/Model.dart';

class Http {
  factory Http() => _getInstance();

  static Http get instance => _getInstance();
  static Http _instance;
  static Dio _dio;

  Http._internal() {
    // 初始化
    _dio = new Dio(Options(
        baseUrl: "http://sellerapp.njshowbao.com/seller-phone/sellerPhone/",
        connectTimeout: 10000,
        contentType: ContentType.parse("application/x-www-form-urlencoded")));
  }

  static Http _getInstance() {
    if (_instance == null) {
      _instance = new Http._internal();
    }
    return _instance;
  }

  get(String path, Function(Model) success, Function(Exception) error) async {
    try {
      Response<Map> response = await _dio.get(path);
      if (response.statusCode != 200) {
//        error(new Exception(
//            "response statusCode=" + response.statusCode.toString()));
        return print("response.statusCode" + response.statusCode.toString());
      }
      print(response);
      Model data = Model.fromJson(response.data);
      success(data);
    } catch (e) {
//      error(e);
      return print(e);
    }
  }

  post(String path, params, Function(Model) success,
      Function(Exception) error) async {
    try {
      Response response = await _dio.post(path, data: params);
      if (response.statusCode != 200) {
//        error(new Exception(
//            "response statusCode=" + response.statusCode.toString()));
        return print("response.statusCode" + response.statusCode.toString());
      }
      print(response);
      Map data=JsonCodec().decode(response.data);
      Model model = Model.fromJson(data);
      success(model);
      print(model);
    } catch (e) {
//      error(e);
      return print(e);
    }
  }
}

