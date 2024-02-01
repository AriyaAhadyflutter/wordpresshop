class AddToCartRequastModel {
  int? userId;
  List<CartProducts>? products;

  AddToCartRequastModel({
    this.userId,
    this.products,
  });
  AddToCartRequastModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    if (json['products'] != null) {
      json['produsts'].forEach((v) {
        products!.add(CartProducts.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    if (products != null) {
      data['products'] = products!.map((e) => e.toString()).toList();
    }
    return data;
  }
}

class CartProducts {
  int? productId;
  int? quantity;

  CartProducts({
    this.productId,
    this.quantity,
  });

  CartProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}
