import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/route_name.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/data/home_data.dart';
import 'package:e_commerce/core/function/handling_data_view.dart';
import 'package:e_commerce/core/model/categories_model.dart';
import 'package:e_commerce/core/widget/custom/pages/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/model/items_model.dart';
import '../core/widget/custom/pages/account_page.dart';
import '../core/widget/custom/pages/cart_page.dart';
import '../core/widget/custom/pages/favorite_page.dart';

abstract class HomeController extends GetxController {
  categoriesView();
  itemsView(String catId, int val);
  changeCountBottom(int val);
  goToItemsView(ItemsModel itemsMod);
}

class HomeControllerImp extends HomeController {
  StatusRequest statusRequest = StatusRequest.none;
  List<Map<String, dynamic>> bottom = [
    {"name": "Home", "icon": Icons.home_filled},
    {"name": "favorite", "icon": Icons.favorite_border},
    {"name": "Cart", "icon": Icons.shopping_cart_outlined},
    {"name": "Account", "icon": Icons.account_circle_outlined},
  ];
  List<Widget> pages = [
    const HomeWidget(),
    const Favorite(),
    const CartPage(),
    const AccountPage()
  ];
  int countBottom = 0;
  int count = 0;
  late int i;
  HomeData homeData = HomeData(Curd());
  List<CategoriesModel> categoriesModel = [];
  List<ItemsModel> itemsModel = [];
  @override
  categoriesView() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await homeData.homeView("1");
    if (request is StatusRequest) {
      statusRequest = handlingData(request);
      update();
    } else {
      if (request['status'] == 'success') {
        List data = request['categories'];
        categoriesModel.addAll(data.map((e) => CategoriesModel.fromJson(e)));
        List data2 = request['items'];
        itemsModel.addAll(data2.map((e) => ItemsModel.fromJson(e)));
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  changePage(val) {
    count = val;
    update();
  }

  @override
  void onInit() {
    categoriesView();
    super.onInit();
  }

  @override
  itemsView(catId, val) async {
    itemsModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var request = await homeData.itemsV(catId);
    if (request is StatusRequest) {
      statusRequest = StatusRequest.failure;
    }
    if (request['status'] == 'success') {
      List data = request['data'];
      itemsModel.addAll(data.map((e) => ItemsModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  changeCountBottom(val) {
    countBottom = val;
    update();
  }

  @override
  goToItemsView(itemsMod) {
    Get.toNamed(RouteName.itemsView, arguments: {"itemsData": itemsMod});
    update();
  }
}
