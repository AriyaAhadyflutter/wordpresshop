import 'package:flutter/material.dart';
import 'package:wordpreesapp/contants/constants.dart';

class CustomDialogBox {
  static void showMassage(
    BuildContext context,
    String title,
    String massage,
    String buttinText,
    final VoidCallback onpressed,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 23,
                  fontFamily: 'iranSans',
                ),
              ),
              content: Text(
                massage,
                style: TextStyle(
                  fontSize: 19,
                  color: MyConstantsSC.primarycolor,
                  fontFamily: 'yagut',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: onpressed,
                  child: Text(
                    buttinText,
                    style: TextStyle(
                      color: MyConstantsSC.primarycolor,
                      fontFamily: 'Lalezar',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
