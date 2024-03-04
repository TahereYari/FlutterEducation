import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product_category.dart';
import 'package:educationsite/models/product_video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChapterTile  extends GetView<HomeController> {
  const ChapterTile ({super.key, required this.productCategory});
  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(

      title: Text(productCategory.title!),
      children: [

        ListView.builder(
          itemCount: controller.productVideo.length,
          itemBuilder: (context, index) {

            // ProductCategory productCategory = controller.productCategory[index];

            ProductVideo? productVideo = controller
                .productVideo
                .where((v) => v.videoCategoryId == productCategory.id)
                .firstOrNull;
            if(productVideo != null){
              return ListTile(
                title: Text(productVideo.name!),
              );
            }


          },
        ),
      ]
    );
  }
  }

