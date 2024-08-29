import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/class/link.dart';
import 'package:e_commerce/core/class/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/font.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());

    return Scaffold(
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: TextButton(
              onPressed: () {
                Get.toNamed(RouteName.proceedBuy);
              },
              child: const Text(
                "proceed to buy",
                style: TextStyle(color: Colors.white),
              ))),
      body: ListView(
        children: [
          Text(
            "Cart",
            textAlign: TextAlign.center,
            style: FontApp.fontName
                .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<CartControllerImp>(
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.cartModel.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  height: MediaQuery.of(context).size.height / 6,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${Link.imageItems}${controller.cartModel[index].itemsImage!}"))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Column(
                          children: [
                            Text(controller.cartModel[index].itemsName!,
                                style: FontApp.fontName
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Text(
                                "\$ ${controller.cartModel[index].itemsPrice!}",
                                style: FontApp.fontName
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TextButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
//Text(controller.cartModel[index].itemsName!)