import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ready_structure/core/networking/models/bases/base_model.dart';
import 'package:ready_structure/core/networking/results/result.dart';

import '../models/api/api_response_model.dart';
import '../models/api/data/base_api_model.dart';
import '../../helpers/enum/http_method_enum.dart';

abstract class NetProvider {
  const NetProvider._();

  Future<Result<T>> sendRequest<T extends BaseApiDataModel>({
    required ResponseConverter<T> converter,
    required HttpMethodEnum method,
    required String url,
    required Map<String, String> headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  });

  Future<Result<T>> request<T extends BaseModel>({
    GeneralResponseConverter<T>? converter,
    required HttpMethodEnum method,
    required String fullUrl,
    required Map<String, String> headers,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  });

  Future<Result<T>> apiRequestWithFiles<T extends BaseApiDataModel>({
    required ResponseConverter<T> converter,
    required HttpMethodEnum method,
    required String url,
    required File? file,
    ProgressCallback? onSendProgress,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  });

  Future<Result<T>> apiRequestWithFormData<T extends BaseApiDataModel>({
    required ResponseConverter<T> converter,
    required HttpMethodEnum method,
    required String url,
    required FormData formData,
    ProgressCallback? onSendProgress,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  });


}
