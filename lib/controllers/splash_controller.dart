

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:educationsite/models/user.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

import 'package:shared_preferences/shared_preferences.dart';

import '../constans/constans.dart';
import '../models/site.dart';

class SplashController extends GetxController{

  final RxString _connectionStatus = '-1'.obs;
  final Rx<Connectivity> _connectivity = Connectivity().obs;
  Rx<User> activeUser = User().obs;

  Rx<Site> site = Site().obs;
  Rx<ConnectivityResult> result = ConnectivityResult.none.obs;

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        _connectionStatus.value = 'ConnectivityResult.wifi';
        print('ConnectivityResult.wifi');

        break;
      case ConnectivityResult.mobile:
        _connectionStatus.value = 'ConnectivityResult.mobile';
        print('ConnectivityResult.mobile');

        break;
      case ConnectivityResult.none:
        _connectionStatus.value = '-1';

        Get.snackbar('اینترنت  متصل نمی باشد', 'لطفا wifi یا داده موبایل را روشن کنید.',
            snackPosition: SnackPosition.TOP);

        break;
      default:
        _connectionStatus.value = 'Failed to get Connectivity';

        break;
    }

    if (_connectionStatus.value != '-1') {
      Future.delayed(const Duration(seconds: 3),() async{
        // Get.toNamed(AppRouts.loginScreen);
        SharedPreferences pref = await SharedPreferences.getInstance();
        String token = pref.getString('token') ?? '-1';

        if(token == '-1'){
          Get.offNamed(AppRouts.loginScreen);
        }
        // else if(token != '-1' ) {
        //   Get.offNamed(AppRouts.homeScreen);
        // }
        else{
          Get.offNamed(AppRouts.homeScreen);
        }

      });
    }
  }

  Future<void> initConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result.value = await _connectivity.value.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.message);
      return;
    }

    return _updateConnectionStatus(result.value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSite();
    getActiveUser();
    initConnectivity();
    ever(result, (_) {
      _connectivity.value.onConnectivityChanged
          .listen((_updateConnectionStatus));
    });

  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    result.close();
    _connectivity.close();
  }

// ***********************************Site*************************************

  getSite() async {
    try{
      dio.Dio myDio = dio.Dio();
      dio.Response response = await myDio.get(
        '${locallhost}/site',
        options: dio.Options(
          method: 'Get',
          responseType: dio.ResponseType.json,
        ),
      );

      if (response.statusCode! < 300) {
        if(response.data['site']!= null){
          site.value = Site.fromJson(response.data['site']);
        }


      }


     

    }
    catch(e,s){
      print(e);
      print(s);
    }

  }


  getActiveUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token') ?? '-1';

    try{
      dio.Dio myDio = dio.Dio();
      dio.Response response = await myDio.get(
        '${locallhost}/activeUser',
        options: dio.Options(
          method: 'Get',
          responseType: dio.ResponseType.json,
          headers: {HttpHeaders.authorizationHeader:'Bearer $token'},
        ),
      );



      if(response.statusCode! < 300){
        if(response.data['user'] != null){
          activeUser.value = User.fromJson(response.data['user']);
        }

      }

      print('name: ');
      print(activeUser.value.name);
      print('image: ');
      print(activeUser.value.image);


      // }
    }
    catch(e){
      print(e);
      // StaticMethodes.unSuccesSnackBar(
      //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
    }

  }
}