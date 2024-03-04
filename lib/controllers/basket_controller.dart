import 'dart:io';

import 'package:educationsite/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constans/constans.dart';
import '../constans/method_static.dart';
import '../models/basket.dart';
import '../models/basketProduct.dart';
import '../models/offcode.dart';
import '../services/app_routs.dart';


class BasketController extends GetConnect{

  RxList<Basket> basketList = <Basket>[].obs;
  RxList<OffCode> allOffCodes = <OffCode>[].obs;
  RxList<BasketProduct> basketProductList = <BasketProduct>[].obs;
  RxList<BasketProduct> mybasketProductList = <BasketProduct>[].obs;
  Rx<Basket> basket = Basket().obs;
  Rx<int> totalPrice = 0.obs;
  Rx<int> countProduct = 0.obs;
  int userId = 0;

  TextEditingController codeController =TextEditingController();


  late SharedPreferences pref;
  String token = '-1';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getToken();
    showPageCart();


  }


  Future<void> getToken() async {
    pref = await SharedPreferences.getInstance();
    token = pref.getString('token') ?? '-1';

    // role = pref.getString('role') ?? 'user';
  }

  getMyBasket() async {
    await getToken();
    int? userId = pref.getInt('user_id');


    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/cart/myBaskets/${userId}',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        print('mybaskets');
        print(response.body['mybaskets']);

        if (response.body['mybaskets'] != null) {
          for (var item in response.body['mybaskets']) {
            basketList.add(Basket.fromJson(item));
          }
        } else {
          StaticMethodes.unSuccesSnackBar(
              'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
        }
      } catch (e, s) {
        StaticMethodes.unSuccesSnackBar(
            'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
      }
    } else {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اجازه دسترسی به این قسمت را ندارید.');
    }
  }


  getCountProduct() async {
    await getToken();

    countProduct.value=0;

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/cart/countProduct/${basket.value.id}',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );


        if (response.body['procuctCount'] != null) {
          countProduct.value = response.body['procuctCount'];
        } else {
          StaticMethodes.unSuccesSnackBar(
              'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
        }
      } catch (e, s) {
        StaticMethodes.unSuccesSnackBar(
            'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
      }
    } else {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اجازه دسترسی به این قسمت را ندارید.');
    }
  }

  myproduceSale(int basketId)async {
    mybasketProductList.clear();
    await getToken();

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/cart/mybaskets/sales/${basketId}',
          headers: {
            HttpHeaders.authorizationHeader:'Bearer $token',
          },
        );
     

        if (response.body['basketproducts']!=null) {

          for (var item in response.body['basketproducts']) {
            mybasketProductList.add(BasketProduct.fromJson(item));
          }
          
          // basket.value = Basket.fromJson(response.body['basket']);

        } else {
          return;
        }
      } catch (e, s) {
        StaticMethodes.unSuccesSnackBar(
            'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
        print(e);
        print(s);
      }
    } else {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اجازه دسترسی به این قسمت را ندارید.');
    }
  }


  Future<void> getAllProducts() async{
    try{
      Response response = await get('${locallhost}/offcode');
      if(response.statusCode!<300){
        for(var item in response.body['offcodes'])
          allOffCodes.add(OffCode.fromJson(item));
      }

    }
    catch(e,s){
      print(e);
      print(s);
    }
  }

  getTotalPrice(int BasketId) async{
    try{
      Response response = await get('${locallhost}/cart/totalPrice/${BasketId}');
      if(response.statusCode!<300){
        totalPrice.value = response.body['totalPrice'];
      }

    }
    catch(e,s){
      print(e);
      print(s);
    }
  }

  showPageCart() async {
    // scrollController.animateTo(scrollController.position.minScrollExtent,
    //     duration: const Duration(milliseconds: 300), curve: Curves.easeOutQuad);
    //  basketProductList.clear();
    await getToken();


    if (token != '-1') {
      // try {
        Response response = await get(
          '${locallhost}/cart/cartPage',

          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );

        if (response.statusCode! < 300) {
          if (response.body['basket'] != null) {
            basket.value = Basket.fromJson(response.body['basket']);
            print('basket.value');
            print(basket.value);
            for (var item in response.body['basketProducts']) {
              basketProductList.add(BasketProduct.fromJson(item));
            }
          }
          else {
            basket.value = null as Basket;
          }
        } else {
          return;
        }
      // } catch (e, s) {
      //   StaticMethodes.unSuccesSnackBar(
      //       'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
      //   print(e);
      //   print(s);
      // }
    } else {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اجازه دسترسی به این قسمت را ندارید.');
    }
  }

  addToBasket(int productId) async {
    await getToken();
    int? userId = pref.getInt('user_id');

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/cart/Insert/${userId}/${productId}',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );

        if (response.statusCode! < 300) {
          StaticMethodes.SuccesSnackBar('محصول به سبد خرید شما اضافه شد.');
          return;
        } else {
          StaticMethodes.unSuccesSnackBar(
              'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
        }
      } catch (e, s) {
        // StaticMethodes.unSuccesSnackBar(
        //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
        print(e);
        print(s);
      }
    } else {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اجازه دسترسی به این قسمت را ندارید.');
    }
  }

  deleteItemBasket(int basket_id, int basketProduct_id) async {
    await getToken();

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/cart/dekete/${basket_id}/${basketProduct_id}',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );
        basketProductList.clear();
        showPageCart();
      } catch (e, s) {
        // StaticMethodes.unSuccesSnackBar(
        //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
        print(e);
        print(s);
      }
    } else {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اجازه دسترسی به این قسمت را ندارید.');
    }
  }

  checkOut(int basket_id)async {
    await getToken();

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/cart/checkout/${basket_id}/',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );

        if (response.statusCode! < 300) {
          StaticMethodes.SuccesSnackBar('سبد خرید شما با موفقیت ثبت شد.');
          basketProductList.clear();
          Get.toNamed(AppRouts.indexWidget);

          // Get.offAllNamed(AppRouts.homeScreen);
          //  basket.value!= null;

        } else {
          // StaticMethodes.unSuccesSnackBar(
          //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');

        }
      } catch (e, s) {
        // StaticMethodes.unSuccesSnackBar(
        //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
        print(e);
        print(s);
      }
    } else {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اجازه دسترسی به این قسمت را ندارید.');
    }
  }
}