import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/ui/card/cardPage.dart';
import 'package:wordpreesapp/ui/catalog/catalogPage.dart';
import 'package:wordpreesapp/ui/home/homePage.dart';
import 'package:wordpreesapp/ui/pofile/profilePage.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int bottomIndex = 0;

  List<Widget> mypages() {
    return [
      const HomePage(),
      const CardPage(),
      const CatalogPage(),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person_pin,
  ];

  List<String> appBarTitles = [
    'خانه',
    'علاقه‌مندی‌ها',
    'سبد‌خرید',
    'پروفایل',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: MyConstantsSC.blackcolor,
                size: 33,
              ),
              Text(
                appBarTitles[bottomIndex],
                style: TextStyle(
                    color: MyConstantsSC.blackcolor,
                    fontSize: 27,
                    fontFamily: 'Lalezar'),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: IndexedStack(
        index: bottomIndex,
        children: mypages(),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: MyConstantsSC.primarycolor,
        activeColor: MyConstantsSC.primarycolor,
        activeIndex: bottomIndex,
        inactiveColor: Colors.black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        icons: iconList,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
      ),
    );
  }
}
