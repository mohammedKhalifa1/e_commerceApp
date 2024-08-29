import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/data/ordera_data.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DetailsController extends GetxController {
  editCount(int val);
  addDetails();
}

class DetailsControllerImp extends DetailsController {
  int count = 0;
  OrderData orderData = OrderData(Curd());
  List<Map<String, dynamic>> rowElevated = [
    {"title": "Cash", "icon": Icons.payments_outlined},
    {"title": "Card", "icon": Icons.credit_card},
    {"title": "pay", "icon": Icons.paid_outlined},
  ];
  late TextEditingController address;
  late TextEditingController number;

  @override
  editCount(val) {
    count = val;
    update();
  }

  @override
  void onInit() {
    address = TextEditingController();
    number = TextEditingController();
    super.onInit();
  }

  StatusRequest statusRequest = StatusRequest.none;
  @override
  addDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await orderData.add(address.text, number.text,
        sharedPreferences.getString("userId")!, count.toString());
    if (request['status'] == 'success') {
      CartControllerImp con = Get.put(CartControllerImp());
      con.cartModel.clear();
      con.view();
      address.text = "";
      number.text = "";
      Get.snackbar("", "success");
    }
  }
}
