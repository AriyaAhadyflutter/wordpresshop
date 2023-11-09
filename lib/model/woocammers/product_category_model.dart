class ProductCategory {
  int? categoryId;
  String? categoryName;

  ProductCategory({
    this.categoryId,
    this.categoryName,
  });
  ProductCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'];
    categoryName = json['name'];
  }
}
