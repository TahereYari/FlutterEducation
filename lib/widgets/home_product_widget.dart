import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/discount.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constans/constans.dart';
import '../controllers/basket_controller.dart';
import '../controllers/favorite_controller.dart';
import '../models/favorite.dart';
import '../models/product.dart';

class HomeProductWidget extends GetView<HomeController> {
  HomeProductWidget({super.key, this.con});

  final con;

  final oCcy = NumberFormat.currency(
      locale: 'eu',
      customPattern: '#,### \u00a4',
      symbol: 'ریال',
      decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => con.isEmpty
          ? const Center(
              child: WidgetLoading(),
            )
          : Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: con.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = con[index];

                  Favorite? favorite = Get.find<FavoriteController>()
                      .favoriteList
                      .where((f) => f.productId == product.id)
                      .firstOrNull;

                  // controller.getDiscountProductList(product.id!);
                  Discount? discount = Get.find<HomeController>()
                      .discountList
                      .where((d) => d.productId == product.id)
                      .firstOrNull;
                  DateTime? startDate;
                  DateTime? endDate;
                  if (discount != null) {
                    startDate = DateTime.parse(discount.startdate!);
                    endDate = DateTime.parse(discount.enddate!);
                  }

                  // if (discount != null) {
                  //   DateTime? startDate = DateTime.parse(discount.startdate!);
                  //   DateTime? endDate = DateTime.parse(discount.enddate!);
                  //   return Container(
                  //     color: kMainBlueColor.withOpacity(0.5),
                  //     width: 200,
                  //     margin: EdgeInsets.only(
                  //       right: con.first.id == product.id ? 0 : 5,
                  //       left: con.last.id == product.id ? 0 : 5,
                  //     ),
                  //     child: InkWell(
                  //       borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //       onTap: () {
                  //         controller. commentOfPtoduct.clear();
                  //         controller.previewProduct(product.id!);
                  //       },
                  //       child: Container(
                  //         width: 160,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Colors.black12,
                  //             width: 1.5,
                  //           ),
                  //           borderRadius:
                  //           const BorderRadius.all(Radius.circular(8)),
                  //         ),
                  //         padding: const EdgeInsets.all(6),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             ClipRRect(
                  //               borderRadius: const BorderRadius.only(
                  //                 topLeft: Radius.circular(8),
                  //                 topRight: Radius.circular(8),
                  //               ),
                  //               child: Image.network(
                  //                 '${local}/image/product/${product.image}',
                  //                 height: 120,
                  //                 width: 180,
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 2,
                  //             ),
                  //             SizedBox(
                  //               height: 60,
                  //               child: Text(
                  //                 product.name!.length > 35
                  //                     ? '${product.name!.substring(0, 35)}...'
                  //                     : product.name!,
                  //                 style: kTextStyle.copyWith(
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 3,
                  //             ),
                  //             product.free == 1 && discount != null
                  //                 ? Container(
                  //               width: Get.width - 60,
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.rectangle,
                  //                 color: kPinkColor,
                  //                 borderRadius:
                  //                 BorderRadiusDirectional.circular(10),
                  //               ),
                  //               child: Center(
                  //                   child: Text(
                  //                     'رایگان',
                  //                     style: kTextStyle.copyWith(
                  //                         color: Colors.white),
                  //                   )
                  //
                  //                 // Text(
                  //                 //   oCcy.format(product.price).toString()!,
                  //                 //   style: kTextStyle.copyWith(color: Colors.white),
                  //                 // ),
                  //               ),
                  //             )
                  //
                  //                 : Container(
                  //               width: Get.width - 60,
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.rectangle,
                  //                 color: kGreenColor,
                  //                 borderRadius:
                  //                 BorderRadiusDirectional.circular(10),
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   oCcy.format(product.price).toString()!,
                  //                   style: kTextStyle.copyWith(
                  //                       color: Colors.white),
                  //                 ),
                  //               ),
                  //             ),
                  //
                  //             if (discount != null &&
                  //                 startDate.isBefore(DateTime.now()) &&
                  //                 endDate.isAfter(DateTime.now())) ...[
                  //               Text(oCcy
                  //                   .format((product.price)! -
                  //                   (discount.precent! * product.price!) /
                  //                       100)
                  //                   .toString())
                  //             ] else ...[
                  //               Text('dis'),
                  //             ],
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             const Spacer(),
                  //             SizedBox(
                  //               width: 150,
                  //               child: Row(
                  //                 children: [
                  //                   Get.find<HomeController>().token != '-1'
                  //                       ? Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: const BoxDecoration(
                  //                           shape: BoxShape.circle,
                  //                           color: Colors.white,
                  //                         ),
                  //                         padding: const EdgeInsets.all(1),
                  //                         child: IconButton(
                  //                           onPressed: () {
                  //                             Get.find<BasketController>()
                  //                                 .addToBasket(product.id!);
                  //                           },
                  //                           icon: const Icon(
                  //                             Icons
                  //                                 .add_shopping_cart_outlined,
                  //                             color: kRedColor,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       const SizedBox(
                  //                         width: 20,
                  //                       ),
                  //                       Container(
                  //                         decoration: const BoxDecoration(
                  //                           shape: BoxShape.circle,
                  //                           color: kLightOrangeColor,
                  //                         ),
                  //                         padding: const EdgeInsets.all(1),
                  //                         child: IconButton(
                  //                           onPressed: () {
                  //                             Get.find<FavoriteController>()
                  //                                 .addFavorite(product.id!);
                  //                             // controller.clear();
                  //                             Get.find<HomeController>()
                  //                                 .getFrontApi();
                  //                           },
                  //                           icon: favorite == null
                  //                               ? Icon(
                  //                             Icons.favorite,
                  //                             color: Colors.white,
                  //                           )
                  //                               : Icon(
                  //                             Icons.favorite,
                  //                             color: Colors.red,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   )
                  //                       : Text(
                  //                     '',
                  //                     style: kTextStyle,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // } else {
                  //   return Container(
                  //     color: kMainBlueColor.withOpacity(0.5),
                  //     width: 200,
                  //     margin: EdgeInsets.only(
                  //       right: con.first.id == product.id ? 0 : 5,
                  //       left: con.last.id == product.id ? 0 : 5,
                  //     ),
                  //     child: InkWell(
                  //       borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //       onTap: () {
                  //         controller. commentOfPtoduct.clear();
                  //         controller.previewProduct(product.id!);
                  //       },
                  //       child: Container(
                  //         width: 160,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Colors.black12,
                  //             width: 1.5,
                  //           ),
                  //           borderRadius:
                  //           const BorderRadius.all(Radius.circular(8)),
                  //         ),
                  //         padding: const EdgeInsets.all(6),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             ClipRRect(
                  //               borderRadius: const BorderRadius.only(
                  //                 topLeft: Radius.circular(8),
                  //                 topRight: Radius.circular(8),
                  //               ),
                  //               child: Image.network(
                  //                 '${local}/image/product/${product.image}',
                  //                 height: 120,
                  //                 width: 180,
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 2,
                  //             ),
                  //             SizedBox(
                  //               height: 60,
                  //               child: Text(
                  //                 product.name!.length > 35
                  //                     ? '${product.name!.substring(0, 35)}...'
                  //                     : product.name!,
                  //                 style: kTextStyle.copyWith(
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 3,
                  //             ),
                  //             product.free == 1
                  //                 ? Container(
                  //               width: Get.width - 60,
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.rectangle,
                  //                 color: kPinkColor,
                  //                 borderRadius:
                  //                 BorderRadiusDirectional.circular(10),
                  //               ),
                  //               child: Center(
                  //                   child: Text(
                  //                     'رایگان',
                  //                     style: kTextStyle.copyWith(
                  //                         color: Colors.white),
                  //                   )
                  //
                  //                 // Text(
                  //                 //   oCcy.format(product.price).toString()!,
                  //                 //   style: kTextStyle.copyWith(color: Colors.white),
                  //                 // ),
                  //               ),
                  //             )
                  //                 : Container(
                  //               width: Get.width - 60,
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.rectangle,
                  //                 color: kGreenColor,
                  //                 borderRadius:
                  //                 BorderRadiusDirectional.circular(10),
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   oCcy.format(product.price).toString()!,
                  //                   style: kTextStyle.copyWith(
                  //                       color: Colors.white),
                  //                 ),
                  //               ),
                  //             ),
                  //
                  //             // if (discount != null &&
                  //             //     startDate.isBefore(DateTime.now()) &&
                  //             //     endDate.isAfter(DateTime.now())) ...[
                  //             //   Text(oCcy
                  //             //       .format((product.price)! -
                  //             //       (discount.precent! * product.price!) /
                  //             //           100)
                  //             //       .toString())
                  //             // ] else ...[
                  //             //   Text('dis'),
                  //             // ],
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             const Spacer(),
                  //             SizedBox(
                  //               width: 150,
                  //               child: Row(
                  //                 children: [
                  //                   Get.find<HomeController>().token != '-1'
                  //                       ? Row(
                  //                     children: [
                  //                       Container(
                  //                         decoration: const BoxDecoration(
                  //                           shape: BoxShape.circle,
                  //                           color: Colors.white,
                  //                         ),
                  //                         padding: const EdgeInsets.all(1),
                  //                         child: IconButton(
                  //                           onPressed: () {
                  //                             Get.find<BasketController>()
                  //                                 .addToBasket(product.id!);
                  //                           },
                  //                           icon: const Icon(
                  //                             Icons
                  //                                 .add_shopping_cart_outlined,
                  //                             color: kRedColor,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       const SizedBox(
                  //                         width: 20,
                  //                       ),
                  //                       Container(
                  //                         decoration: const BoxDecoration(
                  //                           shape: BoxShape.circle,
                  //                           color: kLightOrangeColor,
                  //                         ),
                  //                         padding: const EdgeInsets.all(1),
                  //                         child: IconButton(
                  //                           onPressed: () {
                  //                             Get.find<FavoriteController>()
                  //                                 .addFavorite(product.id!);
                  //                             // controller.clear();
                  //                             Get.find<HomeController>()
                  //                                 .getFrontApi();
                  //                           },
                  //                           icon: favorite == null
                  //                               ? Icon(
                  //                             Icons.favorite,
                  //                             color: Colors.white,
                  //                           )
                  //                               : Icon(
                  //                             Icons.favorite,
                  //                             color: Colors.red,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   )
                  //                       : Text(
                  //                     '',
                  //                     style: kTextStyle,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }

                  return Container(
                    color: kMainBlueColor.withOpacity(0.5),
                    width: 200,
                    margin: EdgeInsets.only(
                      right: con.first.id == product.id ? 0 : 5,
                      left: con.last.id == product.id ? 0 : 5,
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      onTap: () {
                        controller.commentOfPtoduct.clear();
                        controller.previewProduct(product.id!);
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 1.5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                '${local}/image/product/${product.image}',
                                height: 120,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              height: 60,
                              child: Text(
                                product.name!.length > 35
                                    ? '${product.name!.substring(0, 35)}...'
                                    : product.name!,
                                style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            if (product.free == 1) ...[
                              Container(
                                width: Get.width - 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: kPinkColor,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  'رایگان',
                                  style:
                                      kTextStyle.copyWith(color: Colors.white),
                                )

                                    // Text(
                                    //   oCcy.format(product.price).toString()!,
                                    //   style: kTextStyle.copyWith(color: Colors.white),
                                    // ),
                                    ),
                              )
                            ]
                            else ...[
                              if (discount != null &&
                                  startDate!.isBefore(DateTime.now()) &&
                                  endDate!.isAfter(DateTime.now())) ...[
                                Container(
                                  width: Get.width - 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: kGreenColor,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                  ),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: oCcy
                                            .format(product.price)
                                            .toString()!,
                                        style: kTextStyle.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.white,
                                          decorationColor: Colors.red,
                                          decorationThickness: 2.0,
                                        ),
                                      ),
                                    ),
                                    // Text(
                                    //   oCcy.format(product.price).toString()!,
                                    //   style: kTextStyle.copyWith(
                                    //       color: Colors.white),
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: Get.width - 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: kRedColor.withOpacity(0.8),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    oCcy
                                        .format((product.price)! -
                                            (discount.precent! *
                                                    product.price!) /
                                                100)
                                        .toString(),
                                    style: kTextStyle.copyWith(
                                        color: Colors.white),
                                  )),
                                ),
                              ] else ...[
                                Container(
                                  width: Get.width - 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: kGreenColor,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      oCcy.format(product.price).toString()!,
                                      style: kTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 150,
                              child: Row(
                                children: [
                                  Get.find<HomeController>().token != '-1'
                                      ? Row(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              padding: const EdgeInsets.all(1),
                                              child: IconButton(
                                                onPressed: () {
                                                  Get.find<BasketController>()
                                                      .addToBasket(product.id!);
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .add_shopping_cart_outlined,
                                                  color: kRedColor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: kLightOrangeColor,
                                              ),
                                              padding: const EdgeInsets.all(1),
                                              child: IconButton(
                                                onPressed: () {
                                                  Get.find<FavoriteController>().addFavorite(product.id!);

                                                  // Get.find<HomeController>()
                                                  //     .getFrontApi();
                                                },
                                                icon: favorite == null
                                                    ? Icon(
                                                        Icons.favorite,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(
                                          '',
                                          style: kTextStyle,
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
