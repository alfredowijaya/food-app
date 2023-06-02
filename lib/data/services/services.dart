import 'package:dio/dio.dart';
import 'package:food_app/config/envs/env.dart';

class DioApi {
  late Dio dio;

  Dio setupDio() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://${Envrionment.baseUrl}',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    Dio dioOption = Dio(options);

    return dioOption;
  }

  DioApi() {
    dio = setupDio();
  }

  Future<Response> getApi({
    required String url,
    Map<String, String>? params,
    CancelToken? cancelToken,
  }) async {
    try {
      return dio.get(
        url,
        queryParameters: params,
        cancelToken: cancelToken,
      );
    } on DioError catch (err) {
      throw err.error;
    }
  }

  Future<Response> postApi({
    required String url,
    Map<String, String>? body,
    CancelToken? cancelToken,
  }) async {
    try {
      return dio.post(
        url,
        data: body,
        cancelToken: cancelToken,
      );
    } on DioError catch (err) {
      throw err.error;
    }
  }

  Future<Response> patchApi({
    required String url,
    Map<String, String>? body,
    CancelToken? cancelToken,
  }) async {
    try {
      return dio.patch(
        url,
        data: body,
        cancelToken: cancelToken,
      );
    } on DioError catch (err) {
      throw err.error;
    }
  }

  Future<Response> deleteApi({
    required String url,
    Map<String, String>? params,
    CancelToken? cancelToken,
  }) async {
    try {
      return dio.delete(
        url,
        queryParameters: params,
        cancelToken: cancelToken,
      );
    } on DioError catch (err) {
      throw err.error;
    }
  }
}
