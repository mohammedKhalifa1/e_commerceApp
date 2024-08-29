import 'package:e_commerce/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_view_controller.dart';
import '../core/widget/project/bootom_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    Get.put(FavoriteControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: CustomBottom(
          data: controller.bottom,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: controller.pages.elementAt(controller.countBottom)
            // HomeWidget(),
            ),
      ),
    );
  }
}
