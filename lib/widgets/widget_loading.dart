import 'package:educationsite/constans/constans.dart';
import 'package:flutter/material.dart';

class WidgetLoading extends StatelessWidget {
  const WidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(15),
      child:  const CircularProgressIndicator(
        backgroundColor: kMainBlueColor,
        strokeWidth: 6,
        valueColor: AlwaysStoppedAnimation(kBlueColor),
      ),

    );
  }
}
