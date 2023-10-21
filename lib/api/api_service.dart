import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/model/woocammers/register.dart';

class ApiService {
  Future<bool> createCustomer(CustomerModel model) async {
    bool returnResponse = false;
    String authToken = base64.encode(
      utf8.encode("${WoocommerceConstants.consumerKey}:${WoocommerceConstants.consumerSecret}"),
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
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        returnResponse = false;
      } else {
        returnResponse = false;
      }
    }
    return returnResponse;
  }
}
