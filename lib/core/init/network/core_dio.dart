// ignore_for_file: overridden_fields

import 'package:dio/dio.dart';

import 'i_core_dio.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio({
    required this.options,
  });

  @override
  void get2(args) {}
}
