import 'package:e_commerce/controller/details_controller.dart';
import 'package:e_commerce/core/class/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_text_detailes.dart';

class ProceedBuy extends StatelessWidget {
  const ProceedBuy({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsControllerImp());
    return GetBuilder<DetailsControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            onPressed: () {
              controller.addDetails();
            },
            child: const Text("Done"),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Proceed Buy",
            textAlign: TextAlign.center,
            style: FontApp.fontName.copyWith(fontSize: 15),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFromFiledDetails(
                    width: 20,
                    title: "",
                    titleText: "Full address",
                    controller: controller.address,
                    icon: Icons.home),
                TextFromFiledDetails(
                    controller: controller.number,
                    width: 20,
                    title: "",
                    titleText: "Full number",
                    icon: Icons.home),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "  Payment method",
                  // textAlign: TextAlign.end,
                  style: FontApp.fontName.copyWith(fontSize: 15),
                ),
                Wrap(
                  children: [
                    for (int i = 0; i < controller.rowElevated.length; i++)
                      RowContainer(
                        onTap: () {
                          controller.editCount(i);
                        },
                        iconData: controller.rowElevated[i]['icon'],
                        title: controller.rowElevated[i]['title'],
                        active: 0,
                        colorContainer:
                            controller.count == i ? Colors.white : Colors.black,
                        color:
                            controller.count == i ? Colors.black : Colors.white,
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowContainer extends StatelessWidget {
  final int active;
  final Color color;
  final Color colorContainer;
  // final List<Map<String, dynamic>> data;
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const RowContainer({
    super.key,
    required this.active,
    required this.color,
    required this.colorContainer,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: colorContainer,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
        child: SizedBox(
          width: 70,
          child: Row(
            children: [
              Icon(
                iconData,
                color: color,
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
