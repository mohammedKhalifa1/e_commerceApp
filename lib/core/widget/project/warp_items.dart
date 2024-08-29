import 'package:e_commerce/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_view_controller.dart';
import '../../class/link.dart';

class WrapItems extends GetView<HomeControllerImp> {
  const WrapItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // FavoriteControllerImp favController = Get.find<FavoriteControllerImp>();
    FavoriteControllerImp favController = Get.put(FavoriteControllerImp());
    return Center(
      child: Wrap(
        children: [
          for (int i = 0; i < controller.itemsModel.length; i++)
            Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.goToItemsView(controller.itemsModel[i]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "${Link.imageItems}${controller.itemsModel[i].itemsImage}"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${controller.itemsModel[i].itemsName}',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          favController.addFavorite(
                              controller.itemsModel[i].itemsId.toString());
                        },
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
