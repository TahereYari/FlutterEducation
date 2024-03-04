import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/widgets/custom_slider.dart';
import 'package:educationsite/widgets/freeProduct_widget.dart';
import 'package:educationsite/widgets/newProduct_widget.dart';
import 'package:educationsite/widgets/populareProduct_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';
import 'category_widget.dart';

class IndexWidget extends GetView<HomeController> {
  const IndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   backgroundColor: kGreenColor,
          //   pinned: true,
          //   flexibleSpace: Container(
          //     foregroundDecoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [
          //           kRedColor,
          //           Colors.transparent,
          //         ],
          //         begin: Alignment.bottomLeft,
          //         end: Alignment.topRight,
          //       ),
          //     ),
          //     child: const FlexibleSpaceBar(
          //         //   background: VideoSlider(),
          //         ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 30,
                ),
                const CustomSlider(),
                const SizedBox(
                  height: 30,
                ),
                // TextButton(
                //     onPressed: () {
                //       Get.find<BasketController>().showPageCart();
                //       Get.toNamed(AppRouts.basketScreen);
                //     },
                //     child: const Text('سبد خرید')),
                // TextButton(
                //     onPressed: () {
                //       Get.find<HomeController>().getFavorite();
                //       Get.toNamed(AppRouts.favoriteScreen);
                //     },
                //     child: const Text('علاقه مندی')),
                // TextButton(
                //     onPressed: () {
                //       Get.toNamed(AppRouts.frontSearchScreen);
                //     },
                //     child: const Text('جست وجو')),
                //
                // TextButton(onPressed: () {
                //   Get.find<HomeController>().getMyBasket();
                //   Get.toNamed(AppRouts.myBasketScreen);
                // }, child: const Text('لیست خریدهای من')),
                //
                const Divider(),
                NewProduct(),
                const SizedBox(
                  height: 30,
                ),
                 CategoryWidget(),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                PopularProduct(),
                const SizedBox(
                  height: 30,
                ),

                const Divider(),
                FreeProduct(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color:  kLightGreyColor ,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      highlightColor: kGreenColor,
                      onTap:(){
                        // Get.find<DiscountController>().discountFrontList.clear();
                        // Get.find<DiscountController>().getDiscountFrontList();
                        // Get.toNamed(AppRouts.discountPreview);
                      } ,
                      child: SizedBox(
                        height: 100,
                        width: Get.width,

                        child: Center(
                            child: Text(
                              'جدیدترین تخفیفات',
                              style: kHeaderText.copyWith(color: kRedColor),
                            )),
                      ),
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
