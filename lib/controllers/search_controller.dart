import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductController extends GetConnect{

  TextEditingController searchController = TextEditingController();
  RxList<Product> productSearch = <Product>[].obs ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  search() async{
    FocusManager.instance.primaryFocus?.unfocus();
    String text = searchController.text;
    productSearch.clear();

    Response response = await get('${locallhost}/search/${text}');

    if(response.body!=null){

      for(var item in response.body['products']){
        productSearch.add(Product.fromJson(item));
      }
    }
    else
      {
        StaticMethodes.errorSnackBar(   'خطا', 'هیچ پاسخی برای شما از سمت سرور دریافت نشد.');
      }
  }
}