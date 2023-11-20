// https://ahadyariya1387.ir/wp-json/wc/v3/products/

class Products {
  int? id;
  String? name;
  String? description;
  String? shortDescription;
  String? price;
  String? regularPrice;
  List<WooImages>? images;
  List<Categories>? categories;

  Products({
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.price,
    this.regularPrice,
    this.images,
    this.categories,
  });
  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    shortDescription = json['short_description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    if (json['images'] != null) {
      images = <WooImages>[];
      json['images'].forEach((v) {
        images?.add(WooImages.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }
}

class WooImages {
  String? src;
  WooImages({this.src});

  WooImages.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }
}

class Categories {
  num? orderId;
  int? id;
  String? name;

  Categories({
    this.orderId,
    this.id,
    this.name,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
