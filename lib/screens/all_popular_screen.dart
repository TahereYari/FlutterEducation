import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';

class AllPopularScreen extends GetView<HomeController> {
  const AllPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.allPopulars.clear();
        return true;
      },
      child: BaseWidget(
        appBar: AppBar(
          backgroundColor: kMainBlueColor,
          title: Text(
            'محبوبترین دوره ها',
            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        child: Obx(() => Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                if (controller.allPopulars.isEmpty) ...[
                  Expanded(
                    child: Center(
                      child: WidgetLoading(),
                    ),
                  ),
                ] else ...[
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 20.0,
                    padding: EdgeInsets.all(8.0),

                    children: List.generate(
                      controller.allPopulars.length,
                      (index) {
                        Product product = controller.allPopulars[index];
                        // return InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     // width: Get.width,
                        //     // height: 250,
                        //     decoration: BoxDecoration(
                        //         color: kLightGreenColor,
                        //         borderRadius: BorderRadius.circular(10),
                        //         border: Border.all(
                        //           color: Colors.redAccent,
                        //         )),
                        //     padding: EdgeInsets.only(
                        //       top: 10,
                        //       right: 10,
                        //       left: 10,
                        //     ),
                        //     child: SingleChildScrollView(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             Image.network(
                        //                 '${local}/image/product/${product.image}',
                        //               height: 80,
                        //               width: Get.width,
                        //               fit: BoxFit.fitWidth,
                        //             ),
                        //             SizedBox(height: 10,),
                        //             Text(
                        //               product.name!.length >30
                        //                   ?'${product.name!.substring(0,30)}...'
                        //                   :product.name!,
                        //               style: kHeaderText.copyWith(
                        //                 fontSize: 16,
                        //                 color: kBlackColor,
                        //               ),
                        //
                        //
                        //             ),
                        //             SizedBox(height: 10,),
                        //             Text(
                        //               product!.price.toString(),
                        //               style: kHeaderText.copyWith(
                        //                 fontSize: 12,
                        //                 color: kBlackColor,
                        //               ),
                        //
                        //
                        //             ),
                        //             SizedBox(height: 10,),
                        //
                        //           ],
                        //
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // );

                        return FittedBox(
                          fit: BoxFit.contain,
                          child: Card(
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                        '${local}/image/product/${product.image}',
                                      height: 80,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                              Text(
                                                product.name!.length >30
                                                    ?'${product.name!.substring(0,30)}...'
                                                    :product.name!,
                                                style: kHeaderText.copyWith(
                                                  fontSize: 16,
                                                  color: kBlackColor,
                                                ),


                                              ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    product!.price.toString(),
                                                    style: kHeaderText.copyWith(
                                                      fontSize: 12,
                                                      color: kBlackColor,
                                                    )),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.shopping_cart),
                                      onPressed: () {
                                        // Handle add to cart
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.favorite),
                                      onPressed: () {
                                        // Handle add to favorites
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ],
            )),
      ),
    );
  }
}
