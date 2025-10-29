import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeader();
      addDioInterceptor();

      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeader() {
    dio?.options.headers = {
      "Accept": "application/json",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzYxNTkwOTAxLCJleHAiOjE3NjE2NzczMDEsIm5iZiI6MTc2MTU5MDkwMSwianRpIjoic004R2hYM2NDWjFyc1hzVSIsInN1YiI6IjU0MDciLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.MPPG8J4d7yrr1OSiuWH4fDTwOuy3vxfCDMusNj2lxuQ",
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
