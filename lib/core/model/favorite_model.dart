class FavoriteModel {
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategories;
  String? itemsPrice;
  int? favoriteId;
  int? favoriteItems;
  int? favoriteUsers;

  FavoriteModel(
      {this.itemsId,
      this.itemsName,
      this.itemsImage,
      this.itemsCategories,
      this.itemsPrice,
      this.favoriteId,
      this.favoriteItems,
      this.favoriteUsers});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
    favoriteId = json['favorite_id'];
    favoriteItems = json['favorite_items'];
    favoriteUsers = json['favorite_users'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['items_id'] = this.itemsId;
  //   data['items_name'] = this.itemsName;
  //   data['items_image'] = this.itemsImage;
  //   data['items_categories'] = this.itemsCategories;
  //   data['items_price'] = this.itemsPrice;
  //   data['favorite_id'] = this.favoriteId;
  //   data['favorite_items'] = this.favoriteItems;
  //   data['favorite_users'] = this.favoriteUsers;
  //   return data;
  // }
}
