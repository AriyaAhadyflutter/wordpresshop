import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpreesapp/contants/constants.dart';
import 'package:wordpreesapp/model/wordpress/postmodel.dart';
import 'package:wordpreesapp/provider/shop_provider.dart';

class PostsPage extends StatefulWidget {
  final PostsModel? postsModel;
  const PostsPage({
    super.key,
    this.postsModel,
  });

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      ShopProvider productList =
          Provider.of<ShopProvider>(context, listen: false);

      productList.getAllPosts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: SizedBox(),
        );
      }

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: MyConstantsSC.blackcolor,
                    size: 33,
                  ),
                ),
                Text(
                  "مطالب وبلاگ",
                  style: TextStyle(
                      color: MyConstantsSC.blackcolor,
                      fontSize: 27,
                      fontFamily: 'Lalezar'),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Text(
                widget.postsModel!.content.toString(),
                style: TextStyle(
                  fontFamily: 'iranSans',
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: MyConstantsSC.blackcolor.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
