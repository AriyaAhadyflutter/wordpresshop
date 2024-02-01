class AddToCartResponse {
  bool? status;
  List<CardItem>? data;

  AddToCartResponse({
    this.status,
    this.data,
  });

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CardItem>[];
      json['data'].forEach((e) {
        data!.add(CardItem.fromJson(e));
      });
    }
  }
}

class CardItem {
  int? productId;
  String? productName;
  int? productRegularPrice;
  String? thumbnail;
  int? quantity;
  double? lineSubtotal;
  double? lineTotal;
  int? variationId;

  CardItem({
    this.productId,
    this.productName,
    this.productRegularPrice,
    this.thumbnail,
    this.quantity,
    this.lineSubtotal,
    this.lineTotal,
    this.variationId,
  });

  CardItem.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productRegularPrice = json['product_regular_price'];
    thumbnail = json['thumbnail'];
    quantity = json['qty'];
    lineSubtotal = json['line_subtotal'];
    lineTotal = json['line_total'];
    variationId = json['variation_id'];
  }
}
