import 'package:educationsite/controllers/basket_controller.dart';
import 'package:educationsite/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';
import '../controllers/home_controller.dart';
import '../models/basket.dart';
import '../models/basketProduct.dart';
import '../widgets/base_widget.dart';

class SaleScreen extends GetView<BasketController> {
  SaleScreen({super.key});

  // int? offCode = Get.parameters['offCode'] as int?;
  Basket basket = Get.arguments;

// int? lastOff = ((basket.price)+(basket.offcode!));

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: Text(
          'لیست دوره ها ',
          style: kHeaderText,
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: Obx(
              () => ListView.separated(
                itemCount: controller.mybasketProductList.length,
                itemBuilder: (context, index) {
                  BasketProduct basketProduct =
                      controller.mybasketProductList[index];
                  Product? product = Get.find<HomeController>()
                      .allProducts
                      .where((p) => p.id == basketProduct.productId)
                      .firstOrNull;

                  return ListTile(
                    title: Text(product!.name!),
                    leading: Image.network(
                      '${local}/image/product/${product.image}',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'قیمت  : ',
                              style: kTextStyle,
                            )),
                            Expanded(
                                child:
                                    Text('${product.price!.toString()} ریال')),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'قیمت در تخفیف: ',
                              style: kTextStyle,
                            )),
                            Expanded(
                              child: Text(basketProduct.offprice!.toString()),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'قیمت نهایی: ',
                              style: kTextStyle,
                            )),
                            Expanded(
                                child:
                                    Text(
                                        basketProduct.pricefull.toString()
                                    ),),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(color: kGreenColor),
              ),
            ),
          ),
          const Divider(
            color: kRedColor,
            thickness: 3,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    // Expanded(
                    //     child: Text(
                    //   'قیمت کل : ',
                    //   style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                    // )),
                    // Expanded(
                    //     child: Text(controller.totalPrice.value!.toString()))
                    // ([ basket.price, basket.offcode].fold(0, (p, c) => p + c!)).toString()),),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      ' کد تخفیف : ',
                      style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                      child: Text(
                        basket.offcodeId != null
                            ? basket.offcode.toString()
                            : '0 ریال',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'میزان تخفیف نهایی : ',
                      style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(basket.offcode.toString())),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'قیمت قابل پرداخت : ',
                      style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(basket.price.toString())),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
