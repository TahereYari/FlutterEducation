

import 'package:educationsite/models/basket.dart';
import 'package:educationsite/models/comment.dart';
import 'package:educationsite/models/product_video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';
import 'constans.dart';

class StaticMethodes {


  static void errorSnackBar(String title, String content) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: kHeaderText,
      ),
      messageText: Text(
        content,
        style: kTextStyle.copyWith(fontSize: 18),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
  static void SuccesSnackBar(String text) {
    Get.defaultDialog(
      title: '',
      content: Column(
        children: [

          Image.asset(
            'assets/images/succes.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 20,),
          Text(
            text,
            style: kHeaderText.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),

        ],

      ),

    );


  }
  static void unSuccesSnackBar(String text) {
    Get.defaultDialog(
      title: '',
      content: Column(
        children: [
          Image.asset(
            'assets/images/unsucces.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 20,),
          Text(
            text,
            style: kHeaderText.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );

  }

  static bool validateInput(String input, String title){
    if (input.isEmpty) {
      errorSnackBar('خطا', 'لطفا $title راوارد کنید.');
      return false;
    }
    return true;
  }

  static bool validateEmail(String email) {
    if (email.isEmpty) {
      errorSnackBar('خطا', 'لطفا ایمیل راوارد کنید.');
      return false;
    }
    else {
      bool status = GetUtils.isEmail(email);


      //اگر فرمت ایمیل را داشت
      if (!status) {
        errorSnackBar('خطا', 'لطفا ایمیل را صحیح وارد کنید.');
        return false;
      }
    }
    return true;
  }
  static bool validateNumber(String num,String content) {
    if (num.isEmpty) {
      errorSnackBar('خطا', 'لطفا ${content} راوارد کنید.');
      return false;
    }
    else {
      bool status = GetUtils.isNum(num);


      //اگر فرمت عدد را داشت
      if (!status) {
        errorSnackBar('خطا', 'لطفا ${content} را به صورت عدد وارد کنید.');
        return false;
      }

      if (num.length<11) {
        errorSnackBar('خطا', 'لطفا ${content} را به صورت 11 رقمی وارد کنید.');
        return false;
      }
    }
    return true;
  }

  static bool validatePassword(String password) {
    if (password.isEmpty || password.length < 8) {
      errorSnackBar('خطا', 'لطفا رمز عبور را صحیح وارد کنید.');
      return false;
    }
    return true;
  }

  static bool validateConfirmPassword(String confirm,String password) {
    if (confirm.isEmpty || confirm.length < 8) {
      errorSnackBar('خطا', 'لطفا تکرار رمز عبور را صحیح وارد کنید.');
      return false;
    }

    if(confirm != password){
      errorSnackBar('خطا', 'رمز عبور و تکرار آن مطابقت ندارند.');
      return false;
    }
    return true;
  }

  static bottomSheetCheckout() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(height: Get.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: Get.find<HomeController>().commentOfPtoduct.length,
                    itemBuilder: (context, index) {
                      Comment comment = Get.find<HomeController>().commentOfPtoduct[index];

                      String? image = Get.find<HomeController>().userList
                          .where((user) => user.id == comment.userId)
                          .first
                          .image;
                      String? name = Get.find<HomeController>().userList
                          .where((user) => user.id == comment.userId)
                          .first
                          .name;

                      return ListTile(
                        title: Text(
                          name!,
                          style: kHintText,
                        ),
                        leading: CircleAvatar(
                          radius: 20,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: image != ''
                                    ? Image.network(
                                  '${local}/image/user/${image}',
                                  fit: BoxFit.cover,
                                )
                                    : FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: const AssetImage(
                                    'assets/images/userDefult.png',
                                  ),
                                  image: NetworkImage(
                                    '${local}/image/user/${image}',
                                  ),
                                )),
                          ),
                        ),
                        subtitle: Expanded(
                          child: Text(
                            // comment.comment!.length > 20
                            // ? '${comment.comment!.substring(1, 20)}...'
                            // :
                             parseHtmlString(comment.comment!)
                            //   comment.comment!
                             ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  static List<ProductVideo> getVideosForCategory(int productCategory) {
    return Get.find<HomeController>().productVideo
        .where((video) => video.videoCategoryId == productCategory)
        .toList();
  }



}