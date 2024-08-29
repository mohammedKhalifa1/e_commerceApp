import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/data/cart_data.dart';
import 'package:e_commerce/core/model/cart_model.dart';
import 'package:e_commerce/main.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  add(String itemId, String userId, String name);
  view();
  delete(String itemId, String userId);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Curd());
  StatusRequest statusRequest = StatusRequest.none;
  String name = '';
  List<CartModel> cartModel = [];
  @override
  add(itemId, userId, name) async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await cartData.add(itemId, userId, name);
    if (request['status'] == 'success') {
      Get.snackbar("Successful", "The product has been added");
      cartModel.clear();
      view();
      statusRequest = StatusRequest.success;
    }
  }

  @override
  delete(itemId, userId) {}

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await cartData.view(sharedPreferences.getString("userId")!);
    if (request['status'] == 'success') {
      List data = request['data'];
      cartModel.addAll(data.map((e) => CartModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    }

    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
