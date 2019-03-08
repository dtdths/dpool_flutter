import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';


var options = new BaseOptions(
    method:'POST',
    baseUrl: "https://api-functest.dpool.top/api/public",
    connectTimeout: 15000,
    receiveTimeout: 15000,
    contentType: ContentType.parse("application/x-www-form-urlencoded;charset=UTF-8"),
);

Dio dio = new Dio(options);

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}
// 拦截器
void interceptors() {
  dio.interceptors
    ..add(CookieManager(CookieJar()));
    // ..add(LogInterceptor()); //拦截器打印日志
  (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
}