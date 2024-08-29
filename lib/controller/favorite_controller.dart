import 'package:e_commerce/core/class/curd.dart';
import 'package:e_commerce/core/class/status_request.dart';
import 'package:e_commerce/core/data/home_data.dart';
import 'package:e_commerce/core/model/favorite_model.dart';
import 'package:e_commerce/main.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  viewFav();
  addFavorite(String favoriteId);
  deleteFav(String favoriteId);
}

class FavoriteControllerImp extends FavoriteController {
  HomeData homeData = HomeData(Curd());
  StatusRequest statusRequest = StatusRequest.none;
  List<FavoriteModel> favoriteModel = [];

  @override
  viewFav() async {
    statusRequest = StatusRequest.loading;
    update();
    var request =
        await homeData.favoriteView(sharedPreferences.getString("userId")!);
    if (request['status'] == 'success') {
      List data = request['data'];
      favoriteModel.addAll(data.map((e) => FavoriteModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    viewFav();
    super.onInit();
  }

  @override
  addFavorite(favoriteId) async {
    var request = await homeData.favoriteAdd(
        sharedPreferences.getString("userId")!, favoriteId);
    if (request['status'] == 'success') {
      favoriteModel.clear();
      viewFav();
    }
  }

  @override
  deleteFav(String favoriteId) async {
    var request = await homeData.favoriteDelete(
        sharedPreferences.getString("userId")!, favoriteId);
    if (request['status'] == 'success') {
      favoriteModel.clear();
      viewFav();
    }
    update();
  }
}
