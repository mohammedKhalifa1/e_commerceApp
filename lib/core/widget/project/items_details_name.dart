import 'package:e_commerce/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_view_controller.dart';
import '../../model/items_model.dart';

class ItemsDetailsName extends StatelessWidget {
  const ItemsDetailsName({
    super.key,
    required this.itemsID,
  });

  final ItemsModel? itemsID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Brand name : ${itemsID!.itemsName}",
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            itemsID!.itemDescription!,
            style: const TextStyle(
                fontWeight: FontWeight.w100, color: Color(0xff909090)),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "Choose size",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(
            height: 100,
            child: Row(
              children: [RowWidget()],
            ),
          )
        ],
      ),
    );
  }
}

class RowWidget extends GetView<ItemsViewControllerImp> {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> data = ["S", "M", "L"];
    CartControllerImp cart = Get.find<CartControllerImp>();
    return SizedBox(
        height: 60,
        child: GetBuilder<ItemsViewControllerImp>(
          builder: (controller) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                controller.changStatusActive(index);
                cart.name = index.toString();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: controller.count == index ? 1.5 : 0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(data[index],
                        style: const TextStyle(fontWeight: FontWeight.bold))),
              ),
            ),
          ),
        ));
  }
}
