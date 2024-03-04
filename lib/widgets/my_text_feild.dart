import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';


class MyTextFeild extends StatelessWidget {
   MyTextFeild({
    super.key,
    this.hintText,
    this.height = 60,
    this.maxLines,
    required this.controller,
    this.expanded,
    this.suffixIcon,
    this.autofocus,
    this.obscuringCharacter,
     this.prefixIcon,
     this.width,
     this.minLines,
     this.fillColor, this.borderSide ,
  });

  final String? hintText;
  final double? height;
  final double? width;
  final int? maxLines;
  final int? minLines;
  final TextEditingController controller;
  final bool? expanded;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final BorderSide? borderSide;

  final bool? autofocus;
  final String? obscuringCharacter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        maxLines: maxLines,
        minLines: minLines,
        controller: controller,
        expands: expanded ?? false,
        autofocus: autofocus ?? false,
        // textAlign: TextAlign.center,
        // textDirection: TextDirection.rtl,

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kHintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: borderSide ?? BorderSide(color: kGreenColor),

          ),
          filled: true,
          fillColor: fillColor?? Colors.white,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        // obscuringCharacter:obscuringCharacter!,
      ),
    );
  }
}
