import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/product_list_widget.dart';

import 'package:get/get.dart';

import '../constans/constans.dart';
import '../controllers/home_controller.dart';
import '../controllers/search_controller.dart';
import '../models/product.dart';
import 'my_button.dart';
import 'package:flutter/material.dart';

class SearchWidget extends GetView<SearchProductController> {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          controller.searchController.clear();
          controller.productSearch.clear();
          return true;
        },
        child: BaseWidget(

          child: Obx(
                ()=> Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30,),
                SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: kLightGreyColor,
                          prefixIcon: InkWell(
                            onTap: () {
                              controller.search();
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: const Icon(
                              Icons.search_rounded,
                              size: 20,
                            ),
                          ),
                          hintText: 'جست و جو ...',
                          hintStyle: kTextStyle,),
                      ),
                      SizedBox(height: 10,),
                      MyButton(text: 'جست و جو', onTapped: (){   controller.search();})
                    ],
                  ),

                ),
                if (controller.productSearch.isEmpty) ...[
                  Expanded(
                    child: Center(
                      child: Text(
                        'جستجو را براساس نام دوره انجام دهید.',
                        style: kTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child:
                      ProductListWidget(controller: controller.productSearch,),

                  )
                ],


              ],
            ),
          ),
        ));
  }
}
