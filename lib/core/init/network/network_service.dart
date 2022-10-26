import 'package:dio/dio.dart';

import 'i_network_service.dart';

class NetworkService implements INetworkService {
  static NetworkService? _instance;
  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  late final Dio _dio;
  NetworkService._init() : _dio = Dio() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
  }
}
