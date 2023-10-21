import 'package:flutter/material.dart';
import 'package:wordpreesapp/contants/constants.dart';

class CustomFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Object? initialValue;
  final Function(String)? onChanged;
  final TextDirection textDirection;
  final String labelName;
  final TextInputType textInputType;
  const CustomFormField(
      {super.key,
      required this.validator,
      required this.initialValue,
      required this.onChanged,
      required this.textDirection,
      required this.labelName, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        keyboardType: textInputType,
        initialValue: initialValue != null ? initialValue.toString() : '',
        onChanged: onChanged,
        cursorColor: MyConstantsSC.primarycolor,
        style: const TextStyle(
          fontFamily: 'Yekanplus',
          fontSize: 20,
          height: 2,
        ),
        textDirection: textDirection,
        decoration: InputDecoration(
            errorStyle: const TextStyle(
              fontSize: 17,
              fontFamily: 'Yekanplus',
            ),
            hintTextDirection: textDirection,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.2,
                color: MyConstantsSC.primarycolor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            label: Text(
              labelName,
              style: TextStyle(
                fontFamily: 'Lalezar',
                fontSize: 20,
                color: MyConstantsSC.primarycolor,
              ),
            )),
        validator: validator,
      ),
    );
  }
}
