import 'dart:io';
import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/route_name.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/data/account_data.dart';
import 'package:e_commerce/core/model/account_model.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AccountController extends GetxController {
  view();
}

class AccountControllerImp extends AccountController {
  AccountData accountData = AccountData(Curd());
  StatusRequest statusRequest = StatusRequest.none;
  List<AccountModel> accountModel = [];

  List<Map<String, dynamic>> wid = [
    // {
    //   "icon": Icons.watch_later_outlined,
    //   "name": "Preparing",
    //   "onTap": () {
    //     Get.toNamed(RouteName.prepare);
    //   }
    // },
    {
      "icon": Icons.archive_outlined,
      "name": "archive",
      "onTap": () {
        Get.toNamed(RouteName.archive);
      }
    },
    {
      "icon": Icons.help_outline_sharp,
      "name": "Help & support",
      "onTap": () async {
        if (!await launchUrl(Uri.parse(
            'https://www.facebook.com/profile.php?id=100053058408173'))) {
          throw Exception('Could not launch ');
        }
      }
    },
    {
      "icon": Icons.settings,
      "name": "Setting",
      "onTap": () {
        Get.toNamed(RouteName.setting);
      }
    },
    {
      "icon": Icons.logout_outlined,
      "name": "Logout",
      "onTap": () {
        exit(0);
      }
    },
  ];

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var request =
        await accountData.view(sharedPreferences.getString("userId")!);
    if (request['status'] == 'success') {
      accountModel.clear();
      List data = request['data'];
      accountModel.addAll(data.map((e) => AccountModel.fromJson(e)));
      statusRequest = StatusRequest.success;
      update();
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
