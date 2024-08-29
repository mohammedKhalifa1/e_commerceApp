class ItemsViewModel {
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategories;
  String? itemsPrice;
  String? itemDescription;
  int? itemsSmallId;
  int? itemsItems;
  String? itemsNameDetails;

  ItemsViewModel(
      {this.itemsId,
      this.itemsName,
      this.itemsImage,
      this.itemsCategories,
      this.itemsPrice,
      this.itemDescription,
      this.itemsSmallId,
      this.itemsItems,
      this.itemsNameDetails});

  ItemsViewModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
    itemDescription = json['item_description'];
    itemsSmallId = json['items_small_id'];
    itemsItems = json['items_items'];
    itemsNameDetails = json['items_name_details'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['items_id'] = this.itemsId;
  //   data['items_name'] = this.itemsName;
  //   data['items_image'] = this.itemsImage;
  //   data['items_categories'] = this.itemsCategories;
  //   data['items_price'] = this.itemsPrice;
  //   data['item_description'] = this.itemDescription;
  //   data['items_small_id'] = this.itemsSmallId;
  //   data['items_items'] = this.itemsItems;
  //   data['items_name_details'] = this.itemsNameDetails;
  //   return data;
  // }
}
