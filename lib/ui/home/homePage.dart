import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:provider/provider.dart';

import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/provider/shop_provider.dart';
import 'package:wordpreesapp/ui/utils/exstanions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  bool toggleIsFavorit(bool isFavorite) {
    return !isFavorite;
  }

  // final List<String> plantType = [
  //   '| پیشنهادی |',
  //   '| آپارتمانی |',
  //   '| محل کار |',
  //   '|گل باغچه‌ای|',
  //   '| گل سمی |',
  // ];

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      ShopProvider productList =
          Provider.of<ShopProvider>(context, listen: false);
      // productList.getAllProducts();
      productList.getAllCategoryNames();
      productList.getProductByCategory('20');
      productList.getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NumberFormat numberFormat = NumberFormat.decimalPattern('fa');

    return Consumer<ShopProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 13),
                //serch box
                Padding(
                  padding: const EdgeInsets.only(top: 21.69),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: MyConstantsSC.primarycolor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mic,
                          color: MyConstantsSC.blackcolor.withOpacity(0.6),
                        ),
                        const Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'iranSans',
                                fontSize: 14,
                              ),
                              showCursor: false,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 5),
                                hintText: 'جستجو...',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: MyConstantsSC.blackcolor.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ),
                //category

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  height: 70,
                  width: size.width,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: value.productCategory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 25, 8),
                        child: GestureDetector(
                          onTap: () {
                            final categoryId =
                                value.productCategory[index].categoryId;
                            setState(() {
                              selectedIndex = index;
                              value.getProductByCategory(categoryId.toString());
                            });
                          },
                          child: Text(
                            value.productCategory[index].categoryName
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'iranSans',
                              fontSize: 18,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                              color: selectedIndex == index
                                  ? MyConstantsSC.primarycolor
                                  : MyConstantsSC.blackcolor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // product list one

                SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: value.productByCategory.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            color: MyConstantsSC.primarycolor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                right: 20,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: MyConstantsSC.primarycolor,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                right: 50,
                                top: 50,
                                bottom: 50,
                                child: Image.network(
                                  value.productByCategory[index].images![0].src
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 5,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${numberFormat.format(int.parse(value.productByCategory[index].price.toString()))} تومان'
                                        .farsiNumbers,
                                    style: TextStyle(
                                      fontFamily: 'Lalezar',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: MyConstantsSC.primarycolor,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      value.productByCategory[index].categories![0].name
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: ('Lalezar'),
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      value.productByCategory[index].name.toString(),
                                      style: const TextStyle(
                                          fontFamily: ('Yekanplus'),
                                          color: Colors.white70,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //product Text

                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(
                    right: 18,
                    bottom: 15,
                    top: 20,
                  ),
                  child: const Text(
                    "مطالب وبلاگ ",
                    style: TextStyle(
                      fontFamily: 'Lalezar',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //product list two

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  height: size.height * 0.3,
                  child: ListView.builder(
                    itemCount: value.postsModel.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyConstantsSC.primarycolor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80,
                          width: size.width,
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 5),
                                  Text(
                                    'کلیک کنید ',
                                    style: TextStyle(
                                      fontFamily: 'Lalezar',
                                      color: MyConstantsSC.primarycolor,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const SizedBox(
                                    width: 60,
                                    height: 60,
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    right: 55,
                                    child: Column(
                                      children: [
                                        Text(
                                          value.postsModel[index].title
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Lalezar',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
