import 'package:dio/dio.dart';

abstract class IFormDataRequest {
  Future<FormData> toFormData();
}
