// ignore_for_file: prefer_constructors_over_static_methods

import 'package:cf8tpr1nt/core/init/network/i_network_service.dart';
import 'package:dio/dio.dart';

class NetworkService implements INetworkService {
  NetworkService._init() : _dio = Dio() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
  }
  static NetworkService? _instance;
  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  late final Dio _dio;
}
