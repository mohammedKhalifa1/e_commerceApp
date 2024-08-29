import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/data/account_data.dart';
import 'package:e_commerce/core/model/order_model.dart';
import 'package:e_commerce/main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ArchiveController extends GetxController {
  view();
}

class ArchiveControllerImp extends ArchiveController {
  StatusRequest statusRequest = StatusRequest.none;
  AccountData accountData = AccountData(Curd());
  List<OrderModel> orderView = [];

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var request =
        await accountData.archive(sharedPreferences.getString("userId")!);
    if (request['status'] == 'success') {
      List data = request['data'];
      orderView.addAll(data.map((e) => OrderModel.fromJson(e)));
      statusRequest = StatusRequest.success;
      print("success");
    } else {
      print("Failure");
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
