class ItemDetails {
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategories;
  String? itemsPrice;
  int? itemsSmallId;
  String? itemsImageNameOne;
  String? itemsImageNameTow;
  String? itemsImageNameThree;
  String? itemsImageNameFor;
  int? itemsItems;

  ItemDetails(
      {this.itemsId,
      this.itemsName,
      this.itemsImage,
      this.itemsCategories,
      this.itemsPrice,
      this.itemsSmallId,
      this.itemsImageNameOne,
      this.itemsImageNameTow,
      this.itemsImageNameThree,
      this.itemsImageNameFor,
      this.itemsItems});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
    itemsSmallId = json['items_small_id'];
    itemsImageNameOne = json['items_image_name_one'];
    itemsImageNameTow = json['items_image_name_tow'];
    itemsImageNameThree = json['items_image_name_three'];
    itemsImageNameFor = json['items_image_name_for'];
    itemsItems = json['items_items'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['items_id'] = this.itemsId;
  //   data['items_name'] = this.itemsName;
  //   data['items_image'] = this.itemsImage;
  //   data['items_categories'] = this.itemsCategories;
  //   data['items_price'] = this.itemsPrice;
  //   data['items_small_id'] = this.itemsSmallId;
  //   data['items_image_name_one'] = this.itemsImageNameOne;
  //   data['items_image_name_tow'] = this.itemsImageNameTow;
  //   data['items_image_name_three'] = this.itemsImageNameThree;
  //   data['items_image_name_for'] = this.itemsImageNameFor;
  //   data['items_items'] = this.itemsItems;
  //   return data;
  // }
}
