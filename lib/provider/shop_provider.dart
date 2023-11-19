import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordpreesapp/api/api_service.dart';
import 'package:wordpreesapp/model/woocammers/postmodel.dart';
import 'package:wordpreesapp/model/woocammers/product_category_model.dart';

import 'package:wordpreesapp/model/woocammers/productmodel.dart';

class ShopProvider extends ChangeNotifier {
  ApiService? _apiService;

  ShopProvider() {
    _apiService = ApiService();
  }

  bool isLoading = false;
  // store all products
  // List<Products> _products = <Products>[];
  // List<Products> get product => _products;
//
  // store all category products
  List<ProductCategory> _productCategory = <ProductCategory>[];
  List<ProductCategory> get productCategory => _productCategory;
//
  // store all products with category name
  List<Products> _productByCategory = <Products>[];
  List<Products> get productByCategory => _productByCategory;
//
  // store all posts
  List<PostsModel> _postModel = <PostsModel>[];
  List<PostsModel> get postsModel => _postModel;
//
  Future<void> getAllCategoryNames() async {
    isLoading = true;
    notifyListeners();
    final List<ProductCategory> categoryResponse =
        await _apiService!.getProductCategory();
    _productCategory = categoryResponse;
    isLoading = false;
    notifyListeners();
  }

  // Future<void> getAllProducts() async {
  //   isLoading = true;
  //   notifyListeners();
  //   final List<Products> response = await _apiService!.getProducts();
  //   _products = response;
  //   isLoading = false;
  //   notifyListeners();
  // }

  Future<void>  getProductByCategory(String categoryId) async {
    isLoading = true;
    notifyListeners();
    final List<Products> productByCategoryresponse = await _apiService!.getProductCategoryById(categoryId);
    _productByCategory = productByCategoryresponse;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllPosts() async {
    isLoading = true;
    notifyListeners();
    final List<PostsModel> response = await _apiService!.getposts();
    _postModel = response;
    isLoading = false;
    notifyListeners();
  }

  void initialaizeData() {
    _apiService = ApiService();
  }
}
