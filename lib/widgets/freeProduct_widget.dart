import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:educationsite/widgets/home_product_widget.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constans/constans.dart';
import 'my_button.dart';


class FreeProduct extends GetView<HomeController> {
  FreeProduct({super.key});

  final oCcy = NumberFormat.currency(
      locale: 'eu',
      customPattern: '#,### \u00a4',
      symbol: 'ریال',
      decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'دوره های رایگان',
                style: kHeaderText.copyWith(fontSize: 20, color: kRedColor),
              ),
              // InkWell(
              //   onTap: () {},
              //   splashColor: Colors.transparent,
              //   highlightColor: Colors.transparent,
              //   child: Text(
              //     'مشاهده همه',
              //     style: kHeaderText.copyWith(
              //       fontSize: 20,
              //       color: kGreenColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 350,
          child: HomeProductWidget(con: controller.productFrees,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              MyButton(

                  width: 120,
                  text: 'مشاهده همه',
                  fontColor: Colors.white, onTapped: (){
                    controller.allFrees.clear();
                    controller.getAllFrees();
                    Get.toNamed(AppRouts.allFreesProduct);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
