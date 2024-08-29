import 'package:get/get.dart';

abstract class ItemsViewController extends GetxController {}

class ItemsViewControllerImp extends ItemsViewController {
  int count = 0;
  int count2 = 0;
  changeCount2(val) {
    count2 = val;

    update();
  }

  changStatusActive(val) {
    count = val;

    update();
  }
}
