import 'package:e_commerce/core/class/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/image_name.dart';
import '../core/widget/custom/custom_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                ImageName.group,
                height: MediaQuery.of(context).size.height / 1.1,
                width: MediaQuery.of(context).size.width, fit: BoxFit.fill,
                // width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          CustomContainerButton(
              width: 250,
              marginHorizontal: 5,
              marginVertical: 10,
              title: "Get Start",
              onTap: () {
                Get.toNamed(RouteName.signUp);
              },
              color: Colors.black,
              hight: 40)
        ],
      ),
    );
  }
}
