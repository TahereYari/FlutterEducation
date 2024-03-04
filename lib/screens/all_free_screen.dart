import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/product_list_widget.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';

class AllFreesScreen extends GetView<HomeController> {
  const AllFreesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.allFrees.clear();
        return true;
      },
      child: BaseWidget(
        appBar: AppBar(
          backgroundColor: kMainBlueColor,
          title: Text(
            ' همه دوره های رایگان ',
            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        child: ProductListWidget(controller: controller.allFrees,),
      ),
    );
  }
}
