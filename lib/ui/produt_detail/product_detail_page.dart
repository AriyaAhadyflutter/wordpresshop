import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/model/woocammers/addtocart_requast.dart';
import 'package:wordpreesapp/model/woocammers/productmodel.dart';
import 'package:wordpreesapp/provider/loader_provider.dart';
import 'package:wordpreesapp/provider/shop_provider.dart';
import 'package:wordpreesapp/ui/utils/custom_add.dart';
import 'package:wordpreesapp/ui/utils/custom_appbar.dart';
import 'package:wordpreesapp/ui/utils/exstanions.dart';

class ProductDetail extends StatefulWidget {
  final Products? products;
  const ProductDetail({
    super.key,
    this.products,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  NumberFormat numberFormat = NumberFormat.decimalPattern('fa');
  bool isVisible = true;

  int quantity = 0;
  CartProducts cartProducts = CartProducts();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<LoaderProvider>(
      builder: (context, loader, child) {
        return Scaffold(
          body: Stack(
            children: [
              //appbar
              const CustomAppBar(appBarText: 'توضیحات محصول '),
              //texts
              Positioned(
                top: 100,
                left: 20,
                right: 20,
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.8,
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      //image
                      Positioned(
                        top: 25,
                        left: -35,
                        child: SizedBox(
                          height: 200,
                          child: Image.network(
                            widget.products!.images![0].src.toString(),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        right: 0,
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              PlantFeature(
                                  title: 'ترکیبات',
                                  plantFeature:
                                      'جودوسر، شیره ,انگور، توت، خرما'),
                              PlantFeature(
                                  title: 'خواص',
                                  plantFeature: 'کمک به لاغری و کاهش وزن'),
                              PlantFeature(
                                title: 'روش سرو',
                                plantFeature: 'با شیر تو کاسه بخورید ',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 18, left: 30, right: 30, bottom: 50),
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: MyConstantsSC.primarycolor.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: MyConstantsSC.primarycolor,
                                  size: 30,
                                ),
                                Text(
                                  '10'.farsiNumbers,
                                  style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    color: MyConstantsSC.primarycolor,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.products!.name.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Lalezar',
                                    fontSize: 33,
                                    color: MyConstantsSC.primarycolor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      child: Image.asset(
                                          'assets/images/PriceUnit-green.png'),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      numberFormat
                                          .format(int.parse(widget
                                              .products!.price
                                              .toString()))
                                          .farsiNumbers,
                                      style: TextStyle(
                                        fontFamily: 'Lalezar',
                                        fontSize: 26,
                                        color: MyConstantsSC.primarycolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        ReadMoreText(
                          widget.products!.shortDescription
                              .toString()
                              .removeAllHtmlTags,
                          textAlign: TextAlign.justify,
                          trimCollapsedText: 'بیشتر',
                          trimExpandedText: 'کمتر',
                          lessStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'lalezar',
                          ),
                          moreStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'lalezar',
                          ),
                          style: TextStyle(
                            fontFamily: 'iranSans',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: MyConstantsSC.blackcolor.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: SizedBox(
            width: size.width * 0.9,
            height: 45,
            child: Row(
              children: [
                //شاپینگ کارد
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: MyConstantsSC.primarycolor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1.1),
                          blurRadius: 5,
                          color: Colors.red.shade900),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      Positioned(
                        child: Provider.of<ShopProvider>(context, listen: false)
                                    .itemsinCart ==
                                null
                            ? const Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lalezar',
                                ),
                              )
                            : Text(
                                Provider.of<ShopProvider>(context, listen: true)
                                    .itemsinCart! 
                                    .length
                                    .toString()
                                    .farsiNumbers,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lalezar',
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                CustomQuantity(
                  minNumber: 0,
                  maxNumber: 20,
                  iconSize: 8,
                  value: 0,
                  onChange: (value) {
                    cartProducts.quantity = value;
                  },
                ),
                const SizedBox(width: 20),
                // افزودن به سبد خرید
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyConstantsSC.primarycolor,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1.1),
                            blurRadius: 5,
                            color: MyConstantsSC.primarycolor.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: InkResponse(
                          onTap: () {
                            Provider.of<LoaderProvider>(context, listen: false)
                                .setLoadingStatus(true);
                            ShopProvider cartProvider =
                                Provider.of<ShopProvider>(context,
                                    listen: false);
                            cartProducts.productId = widget.products!.id;
                            cartProvider.addToCart(cartProducts, (valu) {
                              Provider.of<LoaderProvider>(context,
                                      listen: false)
                                  .setLoadingStatus(false);
                            });
                          },
                          child: const Text(
                            'افزودن به سبد خرید',
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: MyConstantsSC.blackcolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lalezar',
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: MyConstantsSC.blackcolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lalezar',
          ),
        ),
      ],
    );
  }
}
