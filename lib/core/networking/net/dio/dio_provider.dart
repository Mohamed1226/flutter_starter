import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ready_structure/core/networking/errors/api_error.dart';
import 'package:ready_structure/core/networking/errors/cancel_error.dart';
import 'package:ready_structure/core/networking/errors/forbidden_error.dart';
import 'package:ready_structure/core/networking/errors/http_error.dart';
import 'package:ready_structure/core/networking/errors/net_error.dart';
import 'package:ready_structure/core/networking/errors/timeout_error.dart';
import 'package:ready_structure/core/networking/errors/unauthorized_error.dart';
import 'package:ready_structure/core/networking/errors/unexpected_error.dart';
import 'package:ready_structure/core/networking/errors/unknown_error.dart';
import 'package:ready_structure/core/networking/models/api/api_response_model.dart';
import 'package:ready_structure/core/networking/models/api/data/base_api_model.dart';
import 'package:ready_structure/core/networking/models/api/void_result/void_model.dart';
import 'package:ready_structure/core/networking/models/bases/base_model.dart';
import 'package:ready_structure/core/networking/net/dio/dio_helper.dart';
import 'package:ready_structure/core/networking/net/dio/interceptors/app_network_interceptor.dart';
import 'package:ready_structure/core/helpers/enum/http_method_enum.dart';
import 'package:ready_structure/core/networking/net/net_provider.dart';
import 'package:ready_structure/core/networking/results/result.dart';
import 'package:ready_structure/core/networking/errors/app_error_reporter/app_error_reporter.dart';

import '../../errors/app_error_reporter/app_error_reporter.dart';
import '../../errors/base_error.dart';
import '../../errors/custom_error.dart';

class DioProvider implements NetProvider {
  const DioProvider._();

  @override
  Future<Result<T>> sendRequest<T extends BaseApiDataModel>({
    required ResponseConverter<T> converter,
    required HttpMethodEnum method,
    required String url,
    required Map<String, String> headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    final _dio = DioHelper.dio;
    _dio.interceptors.clear();
    _dio.interceptors.add(AppDioInterceptor(
      dio: _dio,
    ));
    try {
      log('[dio interceptors ${_dio.interceptors.last}]');
      //log('[token ${DIManager.sharedPrefs.token.val}]');
      log('[$method: $url]');
      log('[data].. $data');
      // log('[headers].. $headers');
      log('[queryParams].. $queryParameters');

      // Get the response from the server
      late Response response;
      switch (method) {
        case HttpMethodEnum.GET:
          response = await _dio.get(url,
              queryParameters: queryParameters,
              options: Options(headers: headers),
              cancelToken: cancelToken);
          break;
        case HttpMethodEnum.POST:
          response = await _dio.post(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethodEnum.PUT:
          response = await _dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );

          break;
        case HttpMethodEnum.DELETE:
          response = await _dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }

      log('--------------------------------------------------------------------------------');
      log('\n$response', name: 'ROW RESPONSE');
      log('--------------------------------------------------------------------------------');

      final apiResponseModel =
          ApiResponseModel<T>.fromRawJson(response, converter: converter);

      if (apiResponseModel.message.success) {
        if (T.toString() == 'VoidApiResponse') {
          return Result(
              data: VoidApiResponse(
                  successMessage: apiResponseModel.message.messages) as T);
        }

        return Result(data: apiResponseModel.data);
      } else {
        return Result(error: ApiError(apiResponseModel.message));
      }
    }

    /// Handling Dio Errors
    on DioException catch (e) {
      return Result(error: _handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Result(error: CustomError(message: 'Socket Error'));
    } catch (e, s) {
      log("$e", name: '\nAPI PROVIDER ERROR');
      log('$s');
      AppErrorReporter.recordError(e, stackTrace: s);
      return Result(error: UnknownError());
    }
  }

  @override
  Future<Result<T>> request<T extends BaseModel>({
    GeneralResponseConverter<T>? converter,
    required HttpMethodEnum method,
    required String fullUrl,
    required Map<String, String> headers,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      log('[$method: $fullUrl]');
      log('[Headers: $headers]');

      final _dio = DioHelper.dio;

      // Get the response from the server
      late Response response;
      switch (method) {
        case HttpMethodEnum.GET:
          response = await _dio.get(fullUrl,
              queryParameters: queryParameters,
              options: Options(headers: headers),
              cancelToken: cancelToken);
          break;
        case HttpMethodEnum.POST:
          response = await _dio.post(
            fullUrl,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethodEnum.PUT:
          response = await _dio.put(
            fullUrl,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethodEnum.DELETE:
          response = await _dio.delete(
            fullUrl,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }

      log('--------------------------------------------------------------------------------');
      // log('\n$response', name: 'ROW RESPONSE');
      log('--------------------------------------------------------------------------------');

      var decodedJson;
      if (converter != null) {
        if (response.data is String) {
          decodedJson = json.decode(response.data);
        } else {
          decodedJson = response.data;
        }
        final responseModel = converter.call(decodedJson);
        return Result(data: responseModel);
      } else {
        return Result(data: VoidApiResponse() as T);
      }
    }

    /// Handling Dio Errors
    on DioException catch (e) {
      return Result(error: _handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Result(error: CustomError(message: 'Socket Error'));
    } catch (e, s) {
      log("$e", name: '\nAPI PROVIDER ERROR');
      log('$s');
      AppErrorReporter.recordError(e, stackTrace: s);
      return Result(error: UnknownError());
    }
  }

  @override
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
  }) async {
    try {
      final _dio = DioHelper.dio;
      _dio.interceptors.clear();
      _dio.interceptors.add(AppDioInterceptor(
        dio: _dio,
      ));
      log('[$method: $url]');
      Map<String, dynamic> formDataAsMap = {};
      FormData? formData;
      if (file != null) {
        String fileName = file.path.split('/').last;
        formDataAsMap.addAll(<String, dynamic>{
          "Files": await MultipartFile.fromFile(file.path, filename: fileName),
        });
      }
      if (data != null) formDataAsMap.addAll(data);
      formData = FormData.fromMap(formDataAsMap);

      log('formData ${formData.fields}');
      log('formData files ${formData.files}');
      // Get the response from the server
      late Response response;
      switch (method) {
        case HttpMethodEnum.POST:
          response = await _dio.post(
            url,
            data: formData,
            queryParameters: queryParameters,
            onSendProgress: onSendProgress,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethodEnum.PUT:
          response = await _dio.put(
            url,
            data: formData,
            queryParameters: queryParameters,
            onSendProgress: onSendProgress,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethodEnum.GET:
          response = await _dio.get(url,
              queryParameters: queryParameters,
              options: Options(headers: headers),
              cancelToken: cancelToken);
          break;
        case HttpMethodEnum.DELETE:
          response = await _dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }

      // log('--------------------------------------------------------------------------------');
      // log('\n$response',name: 'ROW RESPONSE');
      // log('--------------------------------------------------------------------------------');

      final apiResponseModel =
          ApiResponseModel<T>.fromRawJson(response, converter: converter);

      if (apiResponseModel.message.success) {
        if (T.toString() == 'VoidApiResponse') {
          return Result(
              data: VoidApiResponse(
                  successMessage: apiResponseModel.message.messages) as T);
        }

        return Result(data: apiResponseModel.data);
      } else {
        return Result(error: ApiError(apiResponseModel.message));
      }
    }

    /// Handling Dio Errors
    on DioException catch (e) {
      return Result(error: _handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Result(error: CustomError(message: 'Socket Error'));
    } catch (e, s) {
      log("$e", name: '\nAPI PROVIDER ERROR');
      log('$s');
      AppErrorReporter.recordError(e, stackTrace: s);
      return Result(error: UnknownError());
    }
  }

  @override
  Future<Result<T>> apiRequestWithFormData<T extends BaseApiDataModel>({
    required ResponseConverter<T> converter,
    required HttpMethodEnum method,
    required String url,
    required FormData formData,
    ProgressCallback? onSendProgress,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    final _dio = DioHelper.dio;
    _dio.interceptors.clear();
    _dio.interceptors.add(AppDioInterceptor(
      dio: _dio,
    ));

    log('[$method: $url]');
    try {
      final _dio = Dio();
      _dio.interceptors.clear();
      _dio.interceptors.add(AppDioInterceptor(
        dio: _dio,
      ));

      // Get the response from the server
      late Response response;
      switch (method) {
        case HttpMethodEnum.POST:
          response = await _dio.post(
            url,
            data: formData,
            onSendProgress: onSendProgress,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethodEnum.PUT:
          response = await _dio.put(
            url,
            data: formData,
            onSendProgress: onSendProgress,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethodEnum.GET:
          response = await _dio.get(url,
              options: Options(headers: headers), cancelToken: cancelToken);
          break;
        case HttpMethodEnum.DELETE:
          response = await _dio.delete(
            url,
            data: formData,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }

      log('--------------------------------------------------------------------------------');
      // log('\n$response', name: 'ROW RESPONSE in FormData request');
      log('--------------------------------------------------------------------------------');

      final apiResponseModel =
          ApiResponseModel<T>.fromRawJson(response, converter: converter);

      if (apiResponseModel.message.success) {
        if (T.toString() == 'VoidApiResponse') {
          return Result(
              data: VoidApiResponse(
                  successMessage: apiResponseModel.message.messages) as T);
        }

        return Result(data: apiResponseModel.data);
      } else {
        return Result(error: ApiError(apiResponseModel.message));
      }
    }

    /// Handling Dio Errors
    on DioException catch (e) {
      return Result(error: _handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return Result(error: CustomError(message: 'Socket Error'));
    } catch (e, s) {
      log("$e", name: '\nAPI PROVIDER ERROR');
      log('$s');
      AppErrorReporter.recordError(e, stackTrace: s);

      return Result(error: UnknownError());
    }
  }

  BaseError _handleDioError(DioException error) {
    log('error : $error', name: '_handleDioError');
    if (error.type == DioExceptionType.unknown ||
        error.type == DioExceptionType.badResponse) {
      if (error is SocketException) return NetError();
      if (error.type == DioExceptionType.badResponse) {
        _logError(error);
        ApiResponseModel? responseModel;
        try {
          responseModel = ApiResponseModel<VoidApiResponse>.fromRawJson(
              error.response,
              converter: VoidApiResponse.converter);
        } catch (_) {}

        switch (error.response!.statusCode) {
          case 403:
            return ForbiddenError();

          case 401:
            return UnauthorizedError(responseModel?.message);
          case 400:
          case 404:
          case 409:
          case 500:
          default:
            log('responseModel.data ${error.response!.data}');
            log('responseModel.statusMessage ${error.response!.statusMessage}');
            //  log('responseModel.message ${responseModel.message}');
            return responseModel != null
                ? HttpError(responseModel.message)
                : HttpError.fromDynamic(error.error);
        }
      }
      return NetError();
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return TimeoutError();
    } else if (error.type == DioExceptionType.cancel) {
      return CancelError();
    } else {
      return UnExpectedError();
    }
  }

  void _logError(DioException error) {
    log('''
---------------------- Error info ----------------------
Error code: ${error.response!.statusCode}
    Request url ${error.requestOptions.path}
    Request data ${error.requestOptions.data}
    Request queryParameters ${error.requestOptions.queryParameters}
    Error data: ${error.response!.data}
    ''');
  }
}
