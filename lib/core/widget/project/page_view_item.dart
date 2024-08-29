import 'package:e_commerce/controller/items_view_controller.dart';
import 'package:e_commerce/core/model/items_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../class/link.dart';
import '../../model/items_model.dart';

class PageItemsView extends GetView<ItemsViewControllerImp> {
  final List<ItemsViewModel> itemDetails;

  final ItemsModel itemsModel;
  final int? i;
  const PageItemsView({
    super.key,
    this.i,
    required this.itemDetails,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: itemDetails.length,
      onPageChanged: (value) {
        controller.changeCount2(value);
      },
      itemBuilder: (context, index) {
        // controller.count2 = index;

        return itemDetails[index].itemsNameDetails != null
            ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "${Link.imageItems}${itemDetails[index].itemsNameDetails!}"),
                  ),
                ),
              )
            : Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "${Link.imageItems}${itemsModel.itemsImage}"),
                  ),
                ),
              );
      },
    );
  }
}
