import 'package:flutter/material.dart';
import 'package:wordpreesapp/contants/constants.dart';

class CustomAppBar extends StatefulWidget {
  final String appBarText;
  const CustomAppBar({
    super.key,
    required this.appBarText,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyConstantsSC.primarycolor.withOpacity(0.15),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Icon(
                Icons.close,
                color: MyConstantsSC.primarycolor,
              ),
            ),
          ),
          Text(
            widget.appBarText,
            style: TextStyle(
              color: MyConstantsSC.primarycolor,
              fontSize: 25,
              fontFamily: 'Lalezar',
            ),
          ),
        ],
      ),
    );
  }
}
