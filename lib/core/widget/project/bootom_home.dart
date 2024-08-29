import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_view_controller.dart';

class CustomBottom extends GetView<HomeControllerImp> {
  final List<Map<String, dynamic>> data;

  const CustomBottom({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height / 11,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.changeCountBottom(index);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Icon(
                        data[index]['icon'],
                        size: controller.countBottom == index ? 27 : 20,
                        color: controller.countBottom == index
                            ? Colors.black
                            : Colors.grey,
                      ),
                      Text(
                        data[index]['name'],
                        style: TextStyle(
                            color: controller.countBottom == index
                                ? Colors.black
                                : Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
