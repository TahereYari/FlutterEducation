import 'package:educationsite/controllers/basket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';


import '../constans/constans.dart';
import '../models/basket.dart';
import '../services/app_routs.dart';
import '../widgets/base_widget.dart';


class MyBasketScreen extends GetView<BasketController> {
  const MyBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: Text(
          'لیست خرید های من',
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
      child: Obx(
        () => ListView.separated(
          itemCount: controller.basketList.length,
          itemBuilder: (BuildContext context, int index) {
            Basket basket = controller.basketList[index];

            // Jalali j1 = basket.updatedAt as Jalali;
            return ListTile(
              title: Row(
                children: [
                  Expanded(
                      child: Text('شماره فاکتور: ',
                          style: kTextStyle.copyWith(
                              fontWeight: FontWeight.bold))),
                  Expanded(
                    child: Text(basket.invoiceNumber!.toString()),
                  ),
                ],
              ),
              subtitle: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text('تاریخ خرید: ',
                                style: kTextStyle.copyWith(
                                    fontWeight: FontWeight.bold))),
                        Expanded(child: Text(basket.createdAt!)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [

                        Expanded(
                            child
                                : basket.isPay == 0
                                    ? Text(('رزور شده'))
                                    : Text(
                                (basket.updatedAt!)
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'مبلغ کل خرید : ',
                          style: kTextStyle,
                        )),
                        Expanded(child: Text(basket.price.toString())),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                onPressed: () {

                  controller.myproduceSale(basket.id!);

                  controller.getTotalPrice(basket.id!);

                  Get.toNamed(AppRouts.saleScreen, arguments: basket);
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: kGreenColor,
                  size: 30,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: kGreenColor,
            thickness: 2,
          ),
        ),
      ),
    );
  }
}
