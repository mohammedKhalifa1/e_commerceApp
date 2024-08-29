import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/link.dart';

import '../class/status_request.dart';

class OrderData {
  Curd curd;
  OrderData(this.curd);

  add(String address, String phone, String userId, String paymentMethod) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request =
        await curd.postData(Link.addOrder, {
      "address": address,
      "phone": phone,
      "userId": userId,
      "paymentMethod": paymentMethod
    });
    return request.fold((l) => l, (r) => r);
  }
}

// class Test {
//   String test1;
//   String test2;
//   Test({required this.test1, required this.test2});
// }

// List<Map<String, Test>> t = [
//   {"1": Test(test1: "test1", test2: "test2")}
// ];
