// https://ahadyariya1387.ir/wp-json/wc/v3/products/

import 'dart:convert';

class Products {
  int? id;
  String? name;
  String? description;
  String? shortDescription;
  String? price;
  String? regularPrice;
  List<WooImage>? images;
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
  Products.fromJson(Map<String,dynamic> json){
    id = json['id'];
  }
}
