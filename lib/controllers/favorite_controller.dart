import 'dart:io';

import 'package:educationsite/controllers/home_controller.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constans/constans.dart';
import '../constans/method_static.dart';
import '../models/favorite.dart';

class FavoriteController extends GetConnect{
  late SharedPreferences pref;
  String token = '-1';


  RxList<Favorite> favoriteList =<Favorite>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getToken();
    getFavorite();
  }

  Future<void> getToken() async {
    pref = await SharedPreferences.getInstance();
    token = pref.getString('token') ?? '-1';
  }

  addFavorite(int productId) async {
    await getToken();

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/favorite/insert/${productId}',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );

        if (response.statusCode! < 300) {

          getFavorite();
          print(response.body['message']);

              // StaticMethodes.SuccesSnackBar(response.body['message']);
          return;
        } else {
          // StaticMethodes.unSuccesSnackBar(
          //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
           response.body['errors'];
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

  getFavorite() async {
       favoriteList.clear();
    await getToken();

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/favorite/view',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );


        if (response.statusCode! < 300) {
          if(response.body['favorites']!= null){
            for(var item in response.body['favorites']){
              favoriteList.add(Favorite.fromJson(item));
            }
          }

        } else {
          // StaticMethodes.unSuccesSnackBar(
          //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
          // response.body['errors'];

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

  deleteFavorite(int productId) async {
    await getToken();

    if (token != '-1') {
      try {
        Response response = await get(
          '${locallhost}/favorite/insert/${productId}',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );

        if (response.statusCode! < 300) {
          StaticMethodes.SuccesSnackBar(response.body['message']);
          return;
        } else {
          // StaticMethodes.unSuccesSnackBar(
          //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
          print(response.body['errors']);
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