class CartModel {
  int? cartId;
  int? cartItems;
  int? cartUserId;
  String? cartSizeItem;
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategories;
  String? itemsPrice;
  String? itemDescription;

  CartModel(
      {this.cartId,
      this.cartItems,
      this.cartUserId,
      this.cartSizeItem,
      this.itemsId,
      this.itemsName,
      this.itemsImage,
      this.itemsCategories,
      this.itemsPrice,
      this.itemDescription});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['Cart_id'];
    cartItems = json['Cart_items'];
    cartUserId = json['Cart_userId'];
    cartSizeItem = json['cart_size_item'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
    itemDescription = json['item_description'];
  }
}
