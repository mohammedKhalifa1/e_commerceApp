import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/items_view_controller.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/class/status_request_handling.dart';
import 'package:e_commerce/core/model/items_view_model.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/curd.dart';
import '../core/data/home_data.dart';
import '../core/model/items_model.dart';
import '../core/widget/project/bottom_navigation_item_small.dart';
import '../core/widget/project/items_details_name.dart';
import '../core/widget/project/page_view_item.dart';
import '../core/widget/project/row_container_small_items.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  ItemsModel? itemsID;
  int? i;
  List<ItemsViewModel> itemDetails = [];
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Curd());
  viewDetails() async {
    var request = await homeData.itemsDetails(itemsID!.itemsId.toString());
    if (request['status'] == 'success') {
      List data = request['data'];
      itemDetails.addAll(data.map((e) => ItemsViewModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    setState(() {});
  }

  @override
  void initState() {
    itemsID = Get.arguments['itemsData'];
    viewDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewControllerImp());
    CartControllerImp cartControllerImp = Get.put(CartControllerImp());
    return GetBuilder<ItemsViewControllerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BottomNavigationItemSmall(
            onTap: () {
              cartControllerImp.add(
                  itemsID!.itemsId.toString(),
                  sharedPreferences.getString("userId")!,
                  cartControllerImp.name);
            }, // ============== add to Cart
          ),
        ),
        appBar: AppBar(
          // backgroundColor: Colors.grey,
          title: const Text(
            "Details",
          ),
        ),
        body: HandlingDataView(
          statusRequest: statusRequest,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xfff2f2f4),
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height / 2.5,
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height / 20),
                  child: PageItemsView(
                    i: 0,
                    itemDetails: itemDetails,
                    itemsModel: itemsID!,
                  ),
                ),
              ),
              RowCont(
                count: controller.count2,
              ),
              ItemsDetailsName(itemsID: itemsID),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text("Price",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Color(0xff909090))),
                    Text("\$ ${itemsID!.itemsPrice!}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
