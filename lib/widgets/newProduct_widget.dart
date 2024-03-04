import 'package:educationsite/controllers/favorite_controller.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:educationsite/widgets/home_product_widget.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constans/constans.dart';
import '../controllers/basket_controller.dart';
import 'my_button.dart';

class NewProduct extends GetView<HomeController> {
  NewProduct({super.key});

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
                'جدیدترین دوره ها',
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
              HomeProductWidget(con: controller.newProducts),
          //     Obx(
          //   () => controller.newProducts.isEmpty
          //       ? const Center(
          //           child: WidgetLoading(),
          //         )
          //       : ListView.builder(
          //           padding: const EdgeInsets.symmetric(horizontal: 10),
          //           physics: const BouncingScrollPhysics(),
          //           scrollDirection: Axis.horizontal,
          //           itemCount: controller.newProducts.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             Product product = controller.newProducts[index];
          //             // controller.getDiscountProductList(product.id!);
          //
          //             return Container(
          //               color: kLightGreyColor.withOpacity(0.5),
          //               width: 200,
          //               margin: EdgeInsets.only(
          //                 right: controller.newProducts.first.id == product.id
          //                     ? 0
          //                     : 5,
          //                 left: controller.newProducts.last.id == product.id
          //                     ? 0
          //                     : 5,
          //               ),
          //               child: InkWell(
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(8)),
          //                 onTap: () {
          //                   // controller. commentOfPtoduct.clear();
          //                   // controller.previewProduct(product.id!);
          //                 },
          //                 child: Container(
          //                   width: 160,
          //                   decoration: BoxDecoration(
          //                     border: Border.all(
          //                       color: Colors.black12,
          //                       width: 1.5,
          //                     ),
          //                     borderRadius:
          //                         const BorderRadius.all(Radius.circular(8)),
          //                   ),
          //                   padding: const EdgeInsets.all(6),
          //                   child: Expanded(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         ClipRRect(
          //                           borderRadius: const BorderRadius.only(
          //                             topLeft: Radius.circular(8),
          //                             topRight: Radius.circular(8),
          //                           ),
          //                           child: Image.network(
          //                             'http://10.0.2.2:8000/image/product/${product.image}',
          //                             height: 120,
          //                             width: 180,
          //                             fit: BoxFit.cover,
          //                           ),
          //                         ),
          //                         const SizedBox(
          //                           height: 2,
          //                         ),
          //                         Text(
          //                           product.name!,
          //                           style: kTextStyle.copyWith(
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         const SizedBox(
          //                           height: 3,
          //                         ),
          //                         Container(
          //                           width: Get.width - 60,
          //                           decoration: BoxDecoration(
          //                             shape: BoxShape.rectangle,
          //                             color: kGreenColor,
          //                             borderRadius:
          //                                 BorderRadiusDirectional.circular(10),
          //                           ),
          //                           child: Center(
          //                             child: Text(
          //                               oCcy.format(product.price).toString()!,
          //                               style: kTextStyle.copyWith(
          //                                   color: Colors.white),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         // Container(
          //                         //   width: Get.width-60,
          //                         //   decoration: BoxDecoration(
          //                         //     shape: BoxShape.rectangle,
          //                         //     color: kRedColor,
          //                         //     borderRadius:
          //                         //         BorderRadiusDirectional.circular(10),
          //                         //   ),
          //                         //   child: Center(
          //                         //     child: Text(
          //                         //       oCcy.format(controller.offPrice.value).toString()!,
          //                         //       style: kTextStyle.copyWith(color: Colors.white),
          //                         //     ),
          //                         //   ),
          //                         // ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         const Spacer(),
          //                         SizedBox(
          //                           width: 150,
          //                           child: Row(
          //                             children: [
          //                               controller.token != '-1'
          //                                   ? Row(
          //                                       children: [
          //                                         Container(
          //                                           decoration:
          //                                               const BoxDecoration(
          //                                             shape: BoxShape.circle,
          //                                             color: kLightOrangeColor,
          //                                           ),
          //                                           padding:
          //                                               const EdgeInsets.all(1),
          //                                           child: IconButton(
          //                                             onPressed: () {
          //                                               Get.find<
          //                                                       BasketController>()
          //                                                   .addToBasket(
          //                                                       product.id!);
          //                                             },
          //                                             icon: const Icon(
          //                                               Icons
          //                                                   .add_shopping_cart_outlined,
          //                                               color: kRedColor,
          //                                             ),
          //                                           ),
          //                                         ),
          //                                         const SizedBox(
          //                                           width: 10,
          //                                         ),
          //                                         Container(
          //                                           decoration:
          //                                               const BoxDecoration(
          //                                             shape: BoxShape.circle,
          //                                             color: kLightOrangeColor,
          //                                           ),
          //                                           padding:
          //                                               const EdgeInsets.all(1),
          //                                           child: IconButton(
          //                                               onPressed: () {
          //                                                 Get.find<
          //                                                         FavoriteController>()
          //                                                     .addFavorite(
          //                                                         product.id!);
          //                                               },
          //                                               icon: Icon(
          //                                                   Icons
          //                                                       .favorite_border_outlined,
          //                                                   color: kRedColor)),
          //                                         ),
          //                                       ],
          //                                     )
          //                                   : Text(
          //                                       '',
          //                                       style: kTextStyle,
          //                                     ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyButton(
                  width: 120,
                  text: 'مشاهده همه',
                  fontColor: Colors.white,
                  onTapped: () {
                    controller.allProducts.clear();
                    controller.getAllProducts();
                    Get.toNamed(AppRouts.allProductScreen);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
