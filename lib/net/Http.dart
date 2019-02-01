import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:marker_business/entity/Model.dart';
import 'package:marker_business/utils/User.dart';

class Http {
  factory Http() => _getInstance();

  static Http get instance => _getInstance();
  static Http _instance;
  static Dio _dio;

  Http._internal() {
    // 初始化
    _dio = new Dio();
    _dio.options.baseUrl =
        "http://sellerapp.njshowbao.com/seller-phone/sellerPhone/";
    _dio.options.connectTimeout = 10000;
    _dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    _dio.interceptors
        .add(new LogInterceptor(requestBody: true, responseBody: true));
  }

  static Http _getInstance() {
    if (_instance == null) {
      _instance = new Http._internal();
    }
    return _instance;
  }

  get(String path, Function(Model) success, Function(Exception) error) async {
    Options options =
    new Options(headers: User.token != null ? {"token": User.token} : {});
    try {
      Response<Map> response = await _dio.get(path, options: options);
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

  post(String path, params, Function(Model) success, Function error) async {
    Options options =
        new Options(headers: User.token != null ? {"token": User.token} : {});
    try {
      Response response =
          await _dio.post(path, queryParameters: params, options: options);
      if (response.statusCode != 200) {
        error(new Exception(
            "response statusCode=" + response.statusCode.toString()));
        return print("response.statusCode" + response.statusCode.toString());
      }
      Map data = JsonCodec().decode(response.data);
      Model model = Model.fromJson(data);
      success(model);
      print(model);
    } catch (e) {
      error(e);
      return print(e);
    }
  }

  uploadPic(File file, Function(Model) success, Function error) async {
    FormData formData =
        new FormData.from({"file": new UploadFileInfo(file, file.path)});
    try {
      Response response =
          await _dio.post("fileupload/uploadFile", data: formData);
      if (response.statusCode != 200) {
        error(new Exception(
            "response statusCode=" + response.statusCode.toString()));
        return print("response.statusCode" + response.statusCode.toString());
      }
      Map data = JsonCodec().decode(response.data);
      Model model = Model.fromJson(data);
      success(model);
    } catch (e) {
      error(e);
      return print(e);
    }
  }
}
