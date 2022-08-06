import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

class ApiExecutor {

  static Type typeOf<T>() => T;

  static Future<dynamic> execute(Future<http.Response> Function() call) async {
    dynamic result;
    try {
      final response = await call();
      result = processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on Exception {
      throw FetchDataException('Network Error');
    }
    return result;
  }

  @visibleForTesting
  static dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
