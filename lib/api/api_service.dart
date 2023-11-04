import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/model/woocammers/loginmodel.dart';
import 'package:wordpreesapp/model/woocammers/productmodel.dart';
import 'package:wordpreesapp/model/woocammers/register.dart';

class ApiService {
  // api ثبت نام 
  Future<bool> createCustomer(CustomerModel model) async {
    bool returnResponse = false;
    String authToken = base64.encode(
      utf8.encode(
          "${WoocommerceConstants.consumerKey}:${WoocommerceConstants.consumerSecret}"),
    );

    try {
      var response = await Dio().post(
        WoocommerceConstants.baseUrl + WoocommerceConstants.customerUrl,
        data: model.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json'
          },
        ),
      );
      if (response.statusCode == 201) {
        returnResponse = true;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        returnResponse = false;
      } else {
        returnResponse = false;
      }
    }
    return returnResponse;
  }
  // api لاگین 
  Future<LoginResponseModel> loginCustomer(
    String username,
    String password,
  ) async {
    late LoginResponseModel loginModel;

    try {
      var response = await Dio().post(
        WoocommerceConstants.tokenURL,
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        loginModel = LoginResponseModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw 'error : $e';
    }
    return loginModel;
  }
  //لیست محصولات 
  Future<List<Products>> getProducts() async {
    final String productsURL =
        "${WoocommerceConstants.baseUrl}${WoocommerceConstants.productUrl}?consumer_key=${WoocommerceConstants.consumerKey}?consumer_secret${WoocommerceConstants.consumerSecret}";
    List<Products> productslist = <Products>[];

    try {
      Response response = await Dio().get(
        productsURL,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        productslist = (response.data as List)
            .map(
              (i) => Products.fromJson(i),
            )
            .toList();
      }
    } on DioException catch (e) {
      throw 'error : $e';
    }
    return productslist;
  }
}
