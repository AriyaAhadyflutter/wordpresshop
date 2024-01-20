import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpreesapp/provider/loader_provider.dart';
import 'package:wordpreesapp/provider/shop_provider.dart';
import 'package:wordpreesapp/ui/home/homePage.dart';
import 'package:wordpreesapp/ui/produt_detail/product_detail_page.dart';
import 'package:wordpreesapp/ui/root/root_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShopProvider(),
          child: const HomePage(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoaderProvider(),
          child: const ProductDetail(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Root(),
      ),
    );
  }
}
