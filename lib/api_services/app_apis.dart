import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/api_services/response_model.dart';

class AppAPI extends GetConnect {
  AppAPI() {
    baseUrl = 'https://fakestoreapi.com/'.toString();
  }
  static Map<String, String> get requestHeaders =>
      {"Content-Type": "application/json"};
  ResponseModel res = ResponseModel();
  SnackbarController errorSnakBar(String title, String error) {
    return Get.snackbar(title, error,
        barBlur: 10,
        backgroundColor: Colors.white,
        messageText:
            Text(error, style: const TextStyle(fontWeight: FontWeight.bold)),
        titleText:
            Text(title, style: const TextStyle(fontWeight: FontWeight.w400)),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        colorText: Colors.black);
  }

  Future<ResponseModel> getMethod(
      {required String path, Map<String, String>? headers}) async {
    bool errorFlag = true;
    res.path = path;
    res.headers = headers;
    try {
      final response = await get(path, headers: headers ?? requestHeaders);
      switch (response.statusCode) {
        case 200:
          res.errorFlag = errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 201:
          res.errorFlag = errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 204:
          res.errorFlag = errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 403:
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 404:
          errorSnakBar('Error',
              "${response.statusCode}: Coudn't reached to Server👎 😱");
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 500:
          errorSnakBar('Error',
              "${response.statusCode}: Error occured while Communication with Server 😑");
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        default:
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
      }
    } on SocketException {
      res.errorFlag = !errorFlag;
      errorSnakBar('Error', "No internet Connection😑");
    } on HttpException {
      res.errorFlag = !errorFlag;
      errorSnakBar('Error', 'Couldn\'t find the post 😱');
    } on FormatException {
      res.errorFlag = !errorFlag;
      errorSnakBar('Error', 'Bad response format 👎 😱');
    }

    return res;
  }

  Future<ResponseModel> postMethod(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    bool errorFlag = true;
    res.path = path;
    res.headers = headers;
    try {
      final response = await post(path, json.encode(body),
          headers: headers ?? requestHeaders);
      switch (response.statusCode) {
        case 200:
          res.errorFlag = errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 201:
          res.errorFlag = errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 204:
          res.errorFlag = errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 40:
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 403:
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 404:
          errorSnakBar('Error',
              "${response.statusCode}: Coudn't reached to Server👎 😱");
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        case 500:
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
        default:
          res.errorFlag = !errorFlag;
          res.responseBody = response.body;
          res.statusCode = response.statusCode;
          return res;
      }
    } on SocketException {
      res.errorFlag = !errorFlag;
      errorSnakBar('Error', "No internet Connection😑");
    } on HttpException {
      res.errorFlag = !errorFlag;
      errorSnakBar('Error', 'Couldn\'t find the post 😱');
    } on FormatException {
      res.errorFlag = !errorFlag;
      errorSnakBar('Error', 'Bad response format 👎 😱');
    }
    return res;
  }

  Future<Map<String, dynamic>> patchMethod(
      {required String path,
      required Map<String, dynamic> body,
      required Map<String, String> headers}) async {
    Map<String, dynamic> data = {};
    try {
      final response = await patch(path, json.encode(body), headers: headers);
      switch (response.statusCode) {
        case 200:
          return response.body;

        case 204:
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;
        case 403:
          errorSnakBar('Session Error', "Session Expired!, Please Login...");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];

          return jsonResponse;
        case 404:
          errorSnakBar('Error',
              "${response.statusCode}: Coudn't reached to Server👎 😱");

          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];

          return jsonResponse;

        case 500:
          errorSnakBar('Error',
              "${response.statusCode}: Error occured while Communication with Server 😑");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;

        default:
          errorSnakBar(
              'Error', "Error occured while Communication with Server 😑");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;
      }
    } on SocketException {
      errorSnakBar('Error', "No internet Connection😑");
    } on HttpException {
      errorSnakBar('Error', 'Couldn\'t find the post 😱');
    } on FormatException {
      errorSnakBar('Error', 'Bad response format 👎 😱');
    }
    return data;
  }

  Future<Map<String, dynamic>> putMethod(
      {required String path,
      required Map<String, dynamic> body,
      required Map<String, String> headers}) async {
    Map<String, dynamic> data = {};
    try {
      final response = await put(path, json.encode(body), headers: headers);
      switch (response.statusCode) {
        case 200:
          return response.body;

        case 204:
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;
        case 403:
          errorSnakBar('Session Error', "Session Expired!, Please Login...");

          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];

          return jsonResponse;
        case 404:
          errorSnakBar('Error',
              "${response.statusCode}: Coudn't reached to Server👎 😱");

          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];

          return jsonResponse;

        case 500:
          errorSnakBar('Error',
              "${response.statusCode}: Error occured while Communication with Server 😑");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;

        default:
          errorSnakBar(
              'Error', "Error occured while Communication with Server 😑");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;
      }
    } on SocketException {
      errorSnakBar('Error', "No internet Connection😑");
    } on HttpException {
      errorSnakBar('Error', 'Couldn\'t find the post 😱');
    } on FormatException {
      errorSnakBar('Error', 'Bad response format 👎 😱');
    }
    return data;
  }

  Future<Map<String, dynamic>> deleteMethod(
      {required String path, required Map<String, String> headers}) async {
    Map<String, dynamic> data = {};
    try {
      final response = await delete(path, headers: headers);
      switch (response.statusCode) {
        case 200:
          return response.body;

        case 204:
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;
        case 403:
          errorSnakBar('Session Error', "Session Expired!, Please Login...");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];

          return jsonResponse;
        case 404:
          errorSnakBar('Error',
              "${response.statusCode}: Coudn't reached to Server👎 😱");

          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];

          return jsonResponse;

        case 500:
          errorSnakBar('Error',
              "${response.statusCode}: Error occured while Communication with Server 😑");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;

        default:
          errorSnakBar(
              'Error', "Error occured while Communication with Server 😑");
          final result = jsonDecode(response.body);
          final jsonResponse = result['message'];
          errorSnakBar('Error', jsonResponse);
          return jsonResponse;
      }
    } on SocketException {
      errorSnakBar('Error', "No internet Connection😑");
    } on HttpException {
      errorSnakBar('Error', 'Couldn\'t find the post 😱');
    } on FormatException {
      errorSnakBar('Error', 'Bad response format 👎 😱');
    }
    return data;
  }
}
