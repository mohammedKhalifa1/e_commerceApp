import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/link.dart';
import 'package:e_commerce/core/class/status_request.dart';

class AuthData {
  Curd curd;
  AuthData(this.curd);
  signUp(String name, String email, String password) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request = await curd.postData(
        Link.signIn, {"name": name, "email": email, "password": password});

    return request.fold((l) => l, (r) => r);
  }

  login(String email, String password) async {
    Either<StatusRequest, Map<dynamic, dynamic>> request =
        await curd.postData(Link.logIn, {"email": email, "password": password});
    return request.fold((l) => l, (r) => r);
  }
}
