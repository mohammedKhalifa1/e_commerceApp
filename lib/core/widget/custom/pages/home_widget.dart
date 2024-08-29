import 'package:e_commerce/controller/home_view_controller.dart';
import 'package:e_commerce/core/class/status_request_handling.dart';
import 'package:e_commerce/core/widget/custom/text_field_for_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/font.dart';
import '../../project/categories_row.dart';
import '../../project/warp_items.dart';

class HomeWidget extends GetView<HomeControllerImp> {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discover",
                style: FontApp.fontName
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextButton(
                onPressed: () {},
                child: const Icon(Icons.notifications_none),
              ),
            ],
          ),
          CustomSearchTextFromField(
              onTap: () {},
              width: 5,
              icon: Icons.search,
              titleText: "search for clothes"),
          CategoriesRow(
            data: controller.categoriesModel,
            countData: controller.count,
            onTap: () {},
          ),
          // you can replace grid view with this
          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: const WrapItems(),
          )
        ],
      ),
    );
  }
}
