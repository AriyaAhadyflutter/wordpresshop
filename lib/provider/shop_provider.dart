import 'package:flutter/material.dart';
import 'package:wordpreesapp/api/api_service.dart';
import 'package:wordpreesapp/model/woocammers/productmodel.dart';

class ShopProvider extends ChangeNotifier {
  ApiService? _apiService;

  ShopProvider() {
    _apiService = ApiService();
  }

  bool isLoading = false;

  List<Products> _products = <Products>[];
  List<Products> get product => _products;

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    final List<Products> response = await _apiService!.getProducts();
    _products = response;
    isLoading = false;
    notifyListeners();
  }

  void initialaizeData() {
    _apiService = ApiService();
  }
}
