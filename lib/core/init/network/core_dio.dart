import 'package:cf8tpr1nt/core/init/network/i_core_dio.dart';
import 'package:dio/dio.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio({
    required this.options,
  });

  @override
  void get2(args) {}
}
