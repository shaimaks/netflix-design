import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;

import 'FetchDataException.dart';


class HttpHelper {
  Future<dynamic> get(String url, {bool auth = true}) async {
    debugPrint(url);
    Map<String, String> hd = await getHeaders(auth);
    var responseJson;
    try {
      var response = await http.get(Uri.parse(url), headers: hd);

      responseJson = _returnResponse(response);

      debugPrint(response.body);
    } on SocketException {
       throw FetchDataException('No Internet connection');
    } catch (e) {
      print(" get $e");
    }
    return responseJson;
  }


  Future<Map<String, String>> getHeaders(bool auth) async {

    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json"
    };
    debugPrint("Header ${headers.toString()}");

    return headers;
  }

  dynamic _returnResponse(http.Response response) async {
    try {
      var responseBody = jsonDecode(response.body);
      debugPrint("statuscode ${response.statusCode}");
      switch (response.statusCode) {
        case 200:
        case 201:
          return response;
        case 400:
          case 401:
          break;
        case 403:


        case 404:

        case 422:

        case 500:


        default:
          var responseJson = response.body;
      }
    } catch (e) {

    }
  }
}
