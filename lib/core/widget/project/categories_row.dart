import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_view_controller.dart';
import '../../class/font.dart';
import '../../model/categories_model.dart';

class CategoriesRow extends GetView<HomeControllerImp> {
  final List<CategoriesModel> data;
  final int countData;
  final VoidCallback onTap;

  const CategoriesRow({
    super.key,
    required this.data,
    required this.countData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.itemsView(
                  controller.categoriesModel[index].categoriesId!.toString(),
                  index);
              controller.changePage(index);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              decoration: BoxDecoration(
                  color: countData == index ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey)),
              child: Center(
                child: Text(
                  data[index].categoriesName!,
                  style: FontApp.fontName.copyWith(
                      fontWeight: FontWeight.bold,
                      color: countData == index ? Colors.white : Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
