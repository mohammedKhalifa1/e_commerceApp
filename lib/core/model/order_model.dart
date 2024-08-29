class OrderModel {
  int? cartId;
  int? cartItems;
  int? cartUserId;
  String? cartSizeItem;
  int? cartStatus;
  int? ordersId;
  String? ordersAddress;
  String? ordersPhone;
  int? ordersUser;
  int? ordersPaymentmethode;
  String? ordersStatus;
  String? ordersDate;
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategories;
  String? itemsPrice;
  String? itemDescription;

  OrderModel(
      {this.cartId,
      this.cartItems,
      this.cartUserId,
      this.cartSizeItem,
      this.cartStatus,
      this.ordersId,
      this.ordersAddress,
      this.ordersPhone,
      this.ordersUser,
      this.ordersPaymentmethode,
      this.ordersStatus,
      this.ordersDate,
      this.itemsId,
      this.itemsName,
      this.itemsImage,
      this.itemsCategories,
      this.itemsPrice,
      this.itemDescription});

  OrderModel.fromJson(Map<String, dynamic> json) {
    cartId = json['Cart_id'];
    cartItems = json['Cart_items'];
    cartUserId = json['Cart_userId'];
    cartSizeItem = json['cart_size_item'];
    cartStatus = json['cart_status'];
    ordersId = json['orders_id'];
    ordersAddress = json['orders_address'];
    ordersPhone = json['orders_phone'];
    ordersUser = json['orders_user'];
    ordersPaymentmethode = json['orders_paymentmethode'];
    ordersStatus = json['orders_status'];
    ordersDate = json['orders_date'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    itemsPrice = json['items_price'];
    itemDescription = json['item_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cart_id'] = this.cartId;
    data['Cart_items'] = this.cartItems;
    data['Cart_userId'] = this.cartUserId;
    data['cart_size_item'] = this.cartSizeItem;
    data['cart_status'] = this.cartStatus;
    data['orders_id'] = this.ordersId;
    data['orders_address'] = this.ordersAddress;
    data['orders_phone'] = this.ordersPhone;
    data['orders_user'] = this.ordersUser;
    data['orders_paymentmethode'] = this.ordersPaymentmethode;
    data['orders_status'] = this.ordersStatus;
    data['orders_date'] = this.ordersDate;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_image'] = this.itemsImage;
    data['items_categories'] = this.itemsCategories;
    data['items_price'] = this.itemsPrice;
    data['item_description'] = this.itemDescription;
    return data;
  }
}
