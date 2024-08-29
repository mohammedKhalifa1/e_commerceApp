import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/link.dart';
import 'package:e_commerce/core/class/status_request.dart';

class CartData {
  Curd curd;
  CartData(this.curd);

  view(String userId) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request =
        await curd.postData(Link.cartView, {"userId": userId});
    return request.fold((l) => l, (r) => r);
  }

  add(String itemsId, String userId, String sized) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request = await curd.postData(
        Link.cartAdd, {"userId": userId, "itemsId": itemsId, "sized": sized});
    return request.fold((l) => l, (r) => r);
  }

  delete(String userId, String itemsId) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request = await curd
        .postData(Link.cartDelete, {"userId": userId, "itemsId": itemsId});
    return request.fold((l) => l, (r) => r);
  }
}
