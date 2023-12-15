import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/networking/net/utils/refresh_token_handler.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';

class AppDioInterceptor extends QueuedInterceptor {
  final Dio dio;

  /// The number of retries in case of 401
  final int retries;
  static bool isRefreshTokenDone = false;

  AppDioInterceptor({required this.dio, this.retries = 3}) {
    dio.interceptors.add(PrettyDioLogger());
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    log('${options.method} request => $requestPath'); // Debug log
    log('Error: ${err.error}, Message: ${err.message}'); // Error log
    final token = locator<AppSharedPrefs>().token.val;
    log('error.response error.response ${err.response?.data} ${token?.isNotEmpty == true}');

    /// Can handle error (Token expired)
    final handleRefreshTokenError =
        ((err.response?.statusCode == 401) && token?.isNotEmpty == true
        // && NetHelper.isExpiredToken(token!)
        );
    if (handleRefreshTokenError) {
      // Check retry attempt
      final attempt = err.requestOptions._retryAttempt + 1;
      if (attempt > retries) {
        print("total attempt $attempt");
        return super.onError(err, handler);
      }
      err.requestOptions._retryAttempt = attempt;
      if (!isRefreshTokenDone) {
        isRefreshTokenDone = true;
        final isRequestSuccess = await _onErrorRefreshingTokenWithHttp();
        if (isRequestSuccess) {
          log("RefreshTokenRequest getTimeLine with http");
          Future.delayed(const Duration(seconds: 3), () {
            isRefreshTokenDone = false;
          });
        }
      }

      log('Expired TOKEN to be refreshed');

      /// Set bearer
      err.requestOptions.headers["Authorization"] = 'Bearer $token';

      /// Create request with new accessToken
      final options = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers);
      //dio.interceptors.requestLock.unlock();
      //dio.interceptors.responseLock.unlock();
      final cloneReq = await dio.request(
        err.requestOptions.path,
        options: options,
        data: err.requestOptions.data,
        cancelToken: err.requestOptions.cancelToken,
        onSendProgress: err.requestOptions.onSendProgress,
        onReceiveProgress: err.requestOptions.onReceiveProgress,
        queryParameters: err.requestOptions.queryParameters,
      );
      log('Token refreshed');
      return handler.resolve(cloneReq);
    }
    return super.onError(err, handler);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  Future<bool> _onErrorRefreshingTokenWithHttp() async {
    return await RefreshTokenHandler.refreshToken(
        refreshToken: locator<AppSharedPrefs>().refreshToken.val!);
  }
}

extension AuthRequestOptionsX on RequestOptions {
  int get _retryAttempt => (extra['auth_retry_attempt'] as int?) ?? 0;

  set _retryAttempt(final int attempt) => extra['auth_retry_attempt'] = attempt;
}
