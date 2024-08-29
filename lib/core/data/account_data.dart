import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/link.dart';

import '../class/status_request.dart';

class AccountData {
  Curd curd;
  AccountData(this.curd);
  view(String userId) async {
    var request = await curd.postData(Link.accountView, {"userId": userId});
    return request.fold((l) => l, (r) => r);
  }

  archive(String userId) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request =
        await curd.postData(Link.archive, {"userId": userId});
    return request.fold((l) => l, (r) => r);
  }
}
