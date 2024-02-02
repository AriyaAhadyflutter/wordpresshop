import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordpreesapp/api/api_service.dart';
import 'package:wordpreesapp/model/woocammers/addto_cart_response.dart';
import 'package:wordpreesapp/model/woocammers/addtocart_requast.dart';
import 'package:wordpreesapp/model/wordpress/postmodel.dart';
import 'package:wordpreesapp/model/woocammers/product_category_model.dart';
import 'package:collection/collection.dart';
import 'package:wordpreesapp/model/woocammers/productmodel.dart';

class ShopProvider extends ChangeNotifier {
  ApiService? _apiService;

  ShopProvider() {
    _apiService = ApiService();
  }

  bool isLoading = false;
  bool isLoadingPost = false;
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
  // item Shopping card
  List<CardItem>? _itemsinCart;
  List<CardItem>? get itemsinCart => _itemsinCart;
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

  Future<void> getProductByCategory(String categoryId) async {
    isLoading = true;
    notifyListeners();
    final List<Products> productByCategoryresponse =
        await _apiService!.getProductCategoryById(categoryId);
    _productByCategory = productByCategoryresponse;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllPosts() async {
    isLoadingPost = true;
    notifyListeners();
    final List<PostsModel> response = await _apiService!.getposts();
    _postModel = response;
    isLoadingPost = false;
    notifyListeners();
  }

  Future<void> addToCart(CartProducts products, Function onCallBack) async {
    AddToCartRequastModel requastModel = AddToCartRequastModel();
    requastModel.products = <CartProducts>[];

    if (_itemsinCart == null) initialaizeData();

    _itemsinCart!.forEach((element) {
      requastModel.products!.add(CartProducts(
          productId: element.productId, quantity: element.quantity));
    });
    CartProducts? duplicatedProductId = requastModel.products!.firstWhereOrNull(
      (prod) => prod.productId == products.productId,
    );
    if (duplicatedProductId != null) {
      requastModel.products!.remove(duplicatedProductId);
    }
    requastModel.products!.add(products);

    await _apiService!.addToCart(requastModel).then((cartResponseModell) {
     
        if (cartResponseModell.data != null) {
          List<CardItem>? newCartResponseModel = cartResponseModell.data;
          _itemsinCart!.addAll(newCartResponseModel!);
        }
      
      onCallBack(cartResponseModell);
      notifyListeners();
    });
  }

  void initialaizeData() {
    _apiService = ApiService();
    _itemsinCart = <CardItem>[];
  }
}
