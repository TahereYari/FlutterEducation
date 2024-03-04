import 'package:educationsite/controllers/basket_controller.dart';
import 'package:educationsite/controllers/discount_Controller.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';
import '../models/basketProduct.dart';
import '../services/app_routs.dart';
import 'my_button.dart';
import 'my_text_feild.dart';

class BasketWidget extends GetView<BasketController> {
  const BasketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      // appBar: AppBar(
      //   backgroundColor: kLightBlueColor,
      //   title: Text(
      //     'سبد خرید',
      //     style: kHeaderText,
      //   ),
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: Get.back,
      //     icon: const Icon(
      //       Icons.arrow_back_rounded,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // if(controller.basket.value!=null)...[
            Obx(
                  () => controller.basketProductList.isEmpty &&
                  controller.basket.value == null
                  ? const Center(
                   child: WidgetLoading(),
              )
                  : Expanded(
                child: ListView.separated(
                  //  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.basketProductList.length,
                  itemBuilder: (context, index) {
                    BasketProduct basketProduct =
                    controller.basketProductList[index];
                    Product? product = Get.find<HomeController>()
                        .allProducts
                        .where((p) => p.id == basketProduct.productId)
                        .first;
                    print(controller.basket.value);

                    return SingleChildScrollView(
                      child: ListTile(
                        title: Text(product.name!),
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
                                      'قیمت : ',
                                      style: kTextStyle,
                                    )),
                                Expanded(
                                    child: Text(
                                        '${product.price!.toString()} ریال')),
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
                                  child: Text(
                                    // product
                                      basketProduct.offprice!.toString()),
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
                                  child: product.free == 1
                                      ? Text(' رایگان ',
                                      style: TextStyle(
                                        color: kRedColor,
                                      ))
                                      : Text(
                                    basketProduct.pricefull
                                        .toString(),

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controller.deleteItemBasket(
                                controller.basket.value.id!,
                                basketProduct.id!);
                          },
                          icon: const Icon(Icons.delete_outline_sharp,
                              color: kRedColor, size: 30),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            ),
            Obx(() => controller.basketProductList.isEmpty &&
                controller.basket.value != null
                ? const Center(
              child: Text(''),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    children: [
                      MyTextFeild(
                        width: Get.width - 100,
                        controller:
                        Get.find<DiscountController>().codeController,
                        hintText: 'کد تخفیف',
                      ),
                      IconButton(
                        onPressed: () {
                          Get.find<DiscountController>()
                              .addDiscount(controller.basket.value.id!);
                        },
                        icon: Icon(
                          Icons.check_circle_outline,
                          size: 40,
                          color: kGreenColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'قیمت قابل پرداخت: ',
                      style: kTextStyle,
                    ),
                    Get.find<DiscountController>().newPrice.value != 0
                        ? Text(Get.find<DiscountController>()
                        .newPrice
                        .toString())
                        : Text(controller.basket.value.price.toString()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    text: 'تکمیل فرآیند خرید',
                    onTapped: () {
                       controller.checkOut(controller.basket.value.id!);
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ))
          // ]
        // else...[
        //   Center(
        //     child: Text('سبد خرید شما خالی است .'),
        //   )
        //   ],
       
        ],
      ),
    );
  }
}
