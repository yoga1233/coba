// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:coba/app/data/app_config.dart';
import 'package:coba/app/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

enum Method { POST, DELETE, GET }

class ApiService {
  Dio _dio = Dio();
  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, String>? headers,
    Map<String, dynamic>? parameters,
    String? baseUrl,
    bool isToken = true,
  }) async {
    Response response;

    final param = parameters ?? <String, dynamic>{};
    final header = headers;

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? AppConfig.baseUrl,
        headers: header,
      ),
    );
    _dio.interceptors.add(dioLoggerInterceptor);
    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: parameters);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url, data: parameters);
      } else {
        response = await _dio.get(url, queryParameters: param);
      }

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized');
      } else if (response.statusCode == 500) {
        throw Exception('Server Error');
      } else {
        throw Exception("Something does wen't wrong'");
      }
    } on SocketException catch (e) {
      logSys(e.toString());
      throw Exception('No Internet Connection');
    } on FormatException catch (e) {
      logSys(e.toString());
      throw Exception('Bad response format');
    } on DioError catch (e) {
      if (e.response != null) {
        logSys(e.response!.data.toString());
        logSys(e.response!.headers.toString());
      } else {
        logSys(e.requestOptions.toString());
        logSys(e.message);
      }
      rethrow;
    }
  }
}
