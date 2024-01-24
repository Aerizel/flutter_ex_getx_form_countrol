import 'package:dio/dio.dart';

const String _baseUrl = "https://jsonplaceholder.typicode.com";

var zyanDairyApi = Dio(
  BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 20),
    contentType: Headers.jsonContentType,
  )
);