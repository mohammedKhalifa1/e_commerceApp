import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/link.dart';
import 'package:e_commerce/core/class/status_request.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);
  homeView(String itemsId) async {
    Either<StatusRequest, Map> request =
        await curd.postData(Link.categories, {"itemsId": itemsId});
    return request.fold((l) => l, (r) => r);
  }

  itemsV(String catId) async {
    Either<StatusRequest, Map> request =
        await curd.postData(Link.itemsView, {"catId": catId});
    return request.fold((l) => l, (r) => r);
  }

  favoriteView(String userId) async {
    Either<StatusRequest, Map> request =
        await curd.postData(Link.favoriteView, {"userId": userId});
    return request.fold((l) => l, (r) => r);
  }

  favoriteAdd(String userId, String fid) async {
    Either<StatusRequest, Map> request =
        await curd.postData(Link.favoriteAdd, {"usersId": userId, "fid": fid});
    return request.fold((l) => l, (r) => r);
  }

  favoriteDelete(String userId, String fid) async {
    Either<StatusRequest, Map> request = await curd
        .postData(Link.favoriteDelete, {"usersId": userId, "fid": fid});
    return request.fold((l) => l, (r) => r);
  }

  itemsDetails(String itemsId) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request =
        await curd.postData(Link.itemsDetails, {"itemsId": itemsId});
    return request.fold((l) => l, (r) => r);
  }
}
