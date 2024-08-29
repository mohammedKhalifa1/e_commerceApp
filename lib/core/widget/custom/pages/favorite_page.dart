import 'package:e_commerce/controller/favorite_controller.dart';
import 'package:e_commerce/core/class/link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteControllerImp>();
    return GetBuilder<FavoriteControllerImp>(
      builder: (controller) {
        return ListView(
          // physics: AlwaysScrollableScrollPhysics(),
          children: [
            const Text(
              "FAVORITE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.favoriteModel.length,
              itemBuilder: (context, index) => Card(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "${Link.imageItems}${controller.favoriteModel[index].itemsImage}",
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 30, top: 10),
                        child: Column(
                          children: [
                            Text(
                              controller.favoriteModel[index].itemsName!,
                              overflow: TextOverflow.fade,
                            ),
                            TextButton(
                              onPressed: () {
                                controller.deleteFav(controller
                                    .favoriteModel[index].itemsId
                                    .toString()
                                    .toString());
                              },
                              child: const Text(
                                "delete",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
