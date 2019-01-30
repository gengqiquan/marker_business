import 'package:dio/dio.dart';

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
    ));
  }

  static Http _getInstance() {
    if (_instance == null) {
      _instance = new Http._internal();
    }
    return _instance;
  }

  static get(
      String path, Function(Map) success, Function(Exception) error) async {
    try {
      Response response = await _dio.get(path);
      if (response.statusCode != 200) {
        error(new Exception(
            "response statusCode=" + response.statusCode.toString()));
        return print("response.statusCode" + response.statusCode.toString());
      }
      print(response);
      Map data = response.data;
      success(data);
    } catch (e) {
      error(e);
      return print(e);
    }
  }
}
