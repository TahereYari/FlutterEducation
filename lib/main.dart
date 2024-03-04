import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:educationsite/controllers/binding/app_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IRANSansWebMedium',
      ),
      initialRoute: AppRouts.splashScreen,
      title: ' سایت آموزشی',
      getPages: AppRouts.getPages,
      locale: const Locale('fa','IR'),
      fallbackLocale: Locale('en', 'UK'),
      initialBinding: AppBinding(),
      defaultTransition: Transition.leftToRightWithFade,


    );
  }
}

