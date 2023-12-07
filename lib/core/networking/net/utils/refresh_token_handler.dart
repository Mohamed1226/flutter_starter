import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:ready_structure/core/networking/errors/app_error_reporter/app_error_reporter.dart';

class RefreshTokenHandler {
  static Future<bool> refreshToken({
    required String refreshToken,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, String> _headers = putHeader();
      var response = await http.post(
        Uri.parse(
          "BASE_URL" + "REFESH_TOKEN_END_Point",
        ),
        body: {
          "client_id": 'flutter.app.client',
          "grant_type": 'refresh_token',
          "scope": 'freejna.identity.api',
          "refresh_token": refreshToken,
        },
        headers: _headers,
      );

      if (response.statusCode == 400) {
        log("RefreshTokenRequest error with http statusCode 400");
      }
      if (response.body.isNotEmpty) {
        //    var result = RefreshTokenModel.fromJson(json.decode(response.body));
        /// add new token
        log("RefreshTokenRequest done with http successfully");
      }
      return true;
    } catch (e, s) {
      /// log out user
      log("RefreshTokenRequest Error with http $e");
      AppErrorReporter.recordError(e,
          stackTrace: s, reason: "CAN NOT REFRESH TOKEN");
      return false;
    }
  }

  static Map<String, String> putHeader() {
    Map<String, String> _headers = {
      "Accept": "*/*",
      "Content-Type": "application/x-www-form-urlencoded",
      "Connection": "keep-alive",
    };

    return _headers;
  }
}
