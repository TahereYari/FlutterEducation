import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductWidget extends GetView<HomeController> {
  const TopProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Image.network(
          '${local}/image/product/${controller.productOne.value.image}',
          height: 200,
          width: Get.width,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10,),
        SizedBox(
          width: Get.width,
          child: Row(
            children: [
              Text(
                'نام:',
                style: kHeaderText.copyWith(fontSize: 23),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  controller.productOne.value.name.toString(),
                  style: kTextStyle,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width,
          child: Row(
            children: [
              Text(
                ' قیمت:',
                style: kHeaderText.copyWith(fontSize: 23),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                ' ${controller.productOne.value.price.toString()} ریال ',
                style: kTextStyle,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          ' توضیحات :',
          style: kHeaderText.copyWith(fontSize: 23),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          StaticMethodes.parseHtmlString(controller.productOne.value.description.toString()),
          style: kTextStyle,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          height: 10,
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       ' توضیحات :',
        //       style: kHeaderText.copyWith(fontSize: 23),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(right: 8.0,left: 8.0),
        //       child: Text(
        //          StaticMethodes.parseHtmlString(controller.productOne.value.description.toString()),
        //         style: kTextStyle,
        //         textAlign: TextAlign.right,
        //         textDirection: TextDirection.rtl,
        //       ),
        //     ),
        //   ],
        // ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
