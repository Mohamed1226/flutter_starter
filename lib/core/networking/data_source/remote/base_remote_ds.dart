import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ready_structure/core/constant/api_constant.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';

import '../../models/api/api_response_model.dart';
import '../../models/api/data/base_api_model.dart';
import '../../../helpers/enum/http_method_enum.dart';
import '../../net/net_provider.dart';
import '../../results/result.dart';

abstract class RemoteDataSource {
  final NetProvider netProvider;

  const RemoteDataSource(this.netProvider);

  Future<Result<D>> apiRequest<D extends BaseApiDataModel>({
    required ResponseConverter<D> converter,
    required HttpMethodEnum method,
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool multiParts = false,
    bool authorized = true,
    CancelToken? cancelToken,
  }) async {
    final String _fullUrl = "${APIConstant.baseUrl}$url";

    Map<String, String> _headers = {"Accept": "*/*"};
    if (multiParts) _headers.addAll({"Content-Type": "multipart/form-data"});

    _headers.addAll(_addAuthAPIHeader(
      authorized: authorized,
    ));

    final result = await netProvider.sendRequest<D>(
      converter: converter,
      method: method,
      headers: _headers,
      url: _fullUrl,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );

    return result;
  }

  Future<Result<D>> apiRequestWithFile<D extends BaseApiDataModel>({
    required ResponseConverter<D> converter,
    required HttpMethodEnum method,
    required String url,
    File? file,
    bool authorized = true,
    ProgressCallback? onSendProgress,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async {
    final String _fullUrl = "${APIConstant.baseUrl}$url";

    Map<String, String> _headers = {
      // "Accept": "application/json",
      "Accept": "*/*",
      "Content-Type": "multipart/form-data",
      "Connection": "keep-alive",
    };

    log('HEADERS $_headers');

    _headers.addAll(_addAuthAPIHeader(
      authorized: authorized,
    ));

    final result = await netProvider.apiRequestWithFiles<D>(
      converter: converter,
      method: method,
      headers: _headers,
      file: file,
      onSendProgress: onSendProgress,
      url: _fullUrl,
      data: data,
      cancelToken: cancelToken,
    );

    return result;
  }

  Future<Result<D>> apiRequestWithFormData<D extends BaseApiDataModel>({
    required ResponseConverter<D> converter,
    required HttpMethodEnum method,
    required String url,
    required FormData formData,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final String _fullUrl = "${APIConstant.baseUrl}$url";

    Map<String, String> _headers = {
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Content-Type": "multipart/form-data",
      "Connection": "keep-alive",
    };

    log('HEADERS $_headers');

    _headers.addAll(_addAuthAPIHeader(
      authorized: true,
    ));

    final result = await netProvider.apiRequestWithFormData<D>(
      converter: converter,
      method: method,
      headers: _headers,
      onSendProgress: onSendProgress,
      url: _fullUrl,
      cancelToken: cancelToken,
      formData: formData,
    );

    return result;
  }

  Map<String, String> _addAuthAPIHeader({
    required bool authorized,
  }) {
    final Map<String, String> headers = {};
    String? token = locator<AppSharedPrefs>().token.val;

    if (authorized && token != null) {
      headers.putIfAbsent('Authorization', () => "Bearer $token");
    }
    return headers;
  }
}
