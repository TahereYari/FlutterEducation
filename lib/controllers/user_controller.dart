import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/controllers/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/app_routs.dart';

class UserController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  late SharedPreferences pref;

  RxBool showPassword = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void changeShowPassword() {
    showPassword.value = !showPassword.value;
  }

  SingnUp() async{
    String name = nameController.text;
    String email = emailController.text;
    String tel = telController.text;
    String password = passController.text;
    String confirm = confirmPassController.text;

    if(StaticMethodes.validateInput(name, 'نام کاربری')&&
          StaticMethodes.validatePassword(password) &&
          StaticMethodes.validateEmail(email) &&
          StaticMethodes.validateNumber(tel,'شماره تلفن') &&
          StaticMethodes.validateConfirmPassword(confirm,password)){

      try{
        http.Response response = await http.post(Uri.parse('${locallhost}/register'),
            body: convert.jsonEncode({
              'name': name,
              'email': email,
              'password': password,
              'tel': tel,
              // 'password-confirmation': password,
            }),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
        );

        pref = await SharedPreferences.getInstance();

        Map responseMap = convert.jsonDecode(response.body);

        if (response.statusCode < 300) {
          User user = User.fromJson(responseMap['user']);
          pref.setString('token', responseMap['token']);
          pref.setString('name', user.name!);
          pref.setString('email', user.email!);
          pref.setString('password', user.password!);
          pref.setInt('user_id', user.id!);
          pref.setInt('role_id', user.roleId!);

          Get.offNamed(AppRouts.homeScreen);
          print(pref.getString('token'));
          nameController.clear();
          emailController.clear();
          telController.clear();
          passController.clear();
          confirmPassController.clear();
        }
        else {
          List list = responseMap['errors']['email'];
          List telList = responseMap['errors']['tel'];
          StaticMethodes.errorSnackBar('خطا', list.first);
          StaticMethodes.errorSnackBar('خطا', telList.first);
        }

      }
      catch(e,s){
        print(s);
      }
    }
   
  }

  LogIn() async {
    String email = emailController.text;
    String password = passController.text;

    if (StaticMethodes.validatePassword(password) &&
        StaticMethodes.validateEmail(email)) {
      try {
        http.Response response = await http.post(
            Uri.parse('${locallhost}/login'),
            body: convert.jsonEncode({
              'email': email,
              'password': password,
            }),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            });
        Map responseMap = convert.jsonDecode(response.body.toString());
        pref = await SharedPreferences.getInstance();
        if(response.statusCode < 300){
          User user =User.fromJson(responseMap['user']);
          await pref.setString('token', responseMap['token']);
          await pref.setString('email', user.email!);
          await pref.setString('name', user.name!);
          await pref.setInt('user_id', user.id!);
          await pref.setString('password', password!);
          // await pref.setInt('role_id', user.roleId!);
          await pref.setString('image', user.image!);
          await pref.setString('tel', user.tel!);

          Get.toNamed(AppRouts.homeScreen);

          print('password: ${pref.getString('password')}');
          print('token: ${pref.getString('token')}');
          print('image: ${pref.getString('image')}');
          print('tel: ${pref.getString('tel')}');
          print('user_id: ${pref.getInt('user_id')}');

          reset();
        }
        else{
          // StaticMethodes.errorSnackBar('خطا',  responseMap['status']);
          StaticMethodes.errorSnackBar('خطا',  'هیچ کاربری با این اطلاعات وارد شده وجود ندارد.');
        }

      } catch (e, s) {
        print(s);
      }
    }
  }

  logOut() async{
    pref = await SharedPreferences.getInstance();
    // await http.get(Uri.parse('${locallhost}/logout'),);
    pref.clear();
    print(pref.getString('token'));
    Get.toNamed(AppRouts.loginScreen);

  }


  editUserProfile(){

    emailController.text = Get.find<SplashController>().activeUser.value.email!;
    nameController.text = Get.find<SplashController>().activeUser.value.name!;
    telController.text = Get.find<SplashController>().activeUser.value.tel!;

    Get.toNamed(AppRouts.userProfileScreen);

  }

   updateUserProfile(){

   }


  reset() {
    emailController.clear();
    passController.clear();
  }
}