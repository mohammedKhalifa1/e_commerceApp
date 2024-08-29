import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/route_name.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/data/auth.dart';
import 'package:e_commerce/core/function/handling_data_view.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AuthController extends GetxController {
  signUp();
  logIn();
}

class AuthControllerImp extends AuthController {
  late TextEditingController nameSignIn;
  late TextEditingController emailSignIn;
  late TextEditingController passwordSignIn;
  late TextEditingController emailLogin;
  late TextEditingController passwordLogin;
  StatusRequest statusRequest = StatusRequest.none;
  AuthData authData = AuthData(Curd());
  @override
  logIn() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await authData.login(emailLogin.text, passwordLogin.text);
    if (request is StatusRequest) {
      statusRequest = handlingData(request);
      update();
    } else {
      if (request['status'] == 'success') {
        sharedPreferences.setString(
            "userName", request['data'][0]['users_name']);
        sharedPreferences.setString(
            "userId", request['data'][0]['users_id'].toString());

        Get.toNamed(RouteName.home);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.notFind;
        update();
      }
    }
  }

  @override
  signUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await authData.signUp(
        nameSignIn.text, emailSignIn.text, passwordSignIn.text);
    if (request is StatusRequest) {
      statusRequest = handlingData(request);
      update();
    } else {
      if (request['status'] == 'success') {
        Get.toNamed(RouteName.home);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.notFind;
        update();
      }
    }
  }
//  statusRequest = handlingData(request);
//     if (statusRequest == StatusRequest.success) {
//       print(" the operation is success");

//       if (request['status'] == 'success') {
//         print("status is Success");
//       } else {
//         print("status is failure");
//       }
//     } else {
//       print(" the operation is failure");
//     }

  @override
  void onInit() {
    emailSignIn = TextEditingController();
    nameSignIn = TextEditingController();
    passwordSignIn = TextEditingController();
    emailLogin = TextEditingController();
    passwordLogin = TextEditingController();
    super.onInit();
  }
}
