import 'package:educationsite/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/product.dart';

class SliderWidget extends GetView<HomeController> {
   SliderWidget({super.key, required this.product});
  final Product product ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        onTap: () {
         controller.previewProduct(product.id!);
        },
        child: Stack(
          children: <Widget>[
            Image.network('${local}/image/product/${product.image}',
                fit: BoxFit.cover, width: Get.width),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child:
                Text(
                  product.name!.length > 35
                      ? '${product.name!.substring(0, 35)}...'
                      : product.name!,
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                         fontSize: 20.0,
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
