import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constans/constans.dart';
import 'home_product_widget.dart';
import 'my_button.dart';


class PopularProduct extends GetView<HomeController> {
  PopularProduct({super.key});

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
                'محبوبترین دوره ها',
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
          child:
          HomeProductWidget(con: controller.populers),
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
                    controller.allPopulars.clear();
                    controller.getAllPopulars();
                    Get.toNamed(AppRouts.allPopularProduct);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
