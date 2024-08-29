import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_view_controller.dart';

class RowCont extends StatelessWidget {
  final int count;

  const RowCont({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsViewControllerImp>(
      builder: (controller) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 2,
          width: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 1.5,
                  width: count == index ? 15 : 5,
                  color: count == index ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
