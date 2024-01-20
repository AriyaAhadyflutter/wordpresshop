import 'package:flutter/material.dart';

class MyConstantsSC {
  //colors
  static Color primarycolor = const Color(0xFF296E48);
  static Color blackcolor = Colors.black54;

  //strings
  static String title1 = 'گیاهان را بهتر از قبل درک کن ';
  static String description1 = '''در مورد نگهداری گیاهان 
  میتونی اطلاعات کسب کنی ''';
  static String title2 = 'با گیاه های جدید اشنا شو ';
  static String description2 = '''رز مشکی یا گل رز دوست داری؟
       اینجا میتونی پیداش کنی''';
  static String title3 = 'با یک گل بهار نمیشه گل بکار ';
  static String description3 = '''هر گلی نیاز داری تو این
   اپلیکیشن پیدا میکنی ''';
}

class WoocommerceConstants {
  static String consumerKey = 'ck_7c5551c46861f2ff868544410bc3af022a6a3793';
  static String consumerSecret = 'cs_185e526bee23cd43e94f76d9612bcf6dd23f9e89';
  // base url
  static String baseUrl = 'https://ahadyariya1387.ir/wp-json/wc/v3/';
  // base url posts
  static String baseUrlPosts =
      'https://ahadyariya1387.ir/wp-json/wp/v2/posts?_embed';

  // token url
  static String tokenURL =
      'https://ahadyariya1387.ir/wp-json/jwt-auth/v1/token';

  // end point
  static String customerUrl = 'customers';
  static String productUrl = 'products';
  static String productCategorytUrl = 'products/categories';
}
