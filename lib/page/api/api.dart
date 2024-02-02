import 'package:dio/dio.dart';
//https://jsonplaceholder.typicode.com
//10.0.2.2:8000
//http://127.0.0.1:8080
//http://192.168.1.5:8080
//http://192.168.10.102:8080

const String _baseUrl = "http://192.168.10.102:8080";

var zyanDairyApi = Dio(
  BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 20),
    contentType: Headers.jsonContentType,
  )
);