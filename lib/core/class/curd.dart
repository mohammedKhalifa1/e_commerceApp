import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/function/check_internet.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Curd {
  Future<Either<StatusRequest, Map<dynamic, dynamic>>> postData(
      String url, Map data) async {
    try {
      var check = await checkInterNet();
      if (check) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return left(StatusRequest.notInternat);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left(StatusRequest.failure);
    }
  }
}
