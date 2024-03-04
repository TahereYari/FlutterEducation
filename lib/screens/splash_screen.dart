import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/controllers/splash_controller.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
   SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [

            const Spacer(),
            controller.site.value.image == null
            ?Image.asset('assets/images/logodefult.png', fit: BoxFit.cover,)
            :Image.network(
              '${local}/image/logo/${controller.site.value.image}'
            ),
            const SizedBox(
              height: 50,
            ),

            Text(
              controller.site.value.name ==null
              ?'به اپلیکیش  ما خوش آمدید'
              :'به اپلیکیش ${controller.site.value.name} ما خوش آمدید',
              style: kHeaderText.copyWith(fontSize: 20),),

            const SizedBox(
              height: 50,
            ),

            const Spacer(),
            WidgetLoading(),
            const SizedBox(
              height: 30,
            ),

          ],
        ),
      ),
    );
  }
}
