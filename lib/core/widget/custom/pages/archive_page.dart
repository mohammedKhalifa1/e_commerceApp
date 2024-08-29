import 'package:e_commerce/controller/archive_controller.dart';
import 'package:e_commerce/core/class/link.dart';
import 'package:e_commerce/core/class/status_request_handling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImp());
    return GetBuilder<ArchiveControllerImp>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Scaffold(
            appBar: AppBar(
              title: const Text("Archive"),
            ),
            body: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  for (int i = 0; i < controller.orderView.length; i++)
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 5,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.height / 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "${Link.imageItems}/${controller.orderView[i].itemsImage}",
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(controller.orderView[i].itemsName!),
                                Text(
                                    "Price ${controller.orderView[i].itemsPrice!} \$"),
                                Text(controller.orderView[i].ordersDate!),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
