
import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/controllers/favorite_controller.dart';
import 'package:educationsite/models/category.dart';
import 'package:educationsite/models/comment.dart';
import 'package:educationsite/models/discount.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/models/product_category.dart';
import 'package:educationsite/models/product_video.dart';
import 'package:educationsite/models/site.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:educationsite/widgets/basket_widget.dart';
import 'package:educationsite/widgets/index_widget.dart';
import 'package:educationsite/widgets/search_widget.dart';
import 'package:educationsite/widgets/slider_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


import '../constans/method_static.dart';
import '../models/user.dart';
import 'basket_controller.dart';



class HomeController extends GetConnect{

  RxList<Widget> imageSlider = <Widget>[].obs;
  RxList<Product> productImageList = <Product>[].obs;
  RxList<Product> productFrees = <Product>[].obs;
  RxList<Product> newProducts = <Product>[].obs;
  RxList<Product> populers = <Product>[].obs;
  RxList<Category> categoryImages = <Category>[].obs;
  RxList<Product> allProducts = <Product>[].obs;
  RxList<Product> allPopulars = <Product>[].obs;
  RxList<Product> allFrees = <Product>[].obs;
  RxList<Product> categoryProducts = <Product>[].obs;
  RxList<Discount> discountList = <Discount>[].obs;
  RxList<Category> allCategory = <Category>[].obs;
  Rx<Product> productOne = Product().obs;
  RxList<Comment> commentOfPtoduct = <Comment>[].obs;
  RxList<ProductCategory> productCategory = <ProductCategory>[].obs;
  RxList<ProductVideo> productVideo = <ProductVideo>[].obs;
  RxList<User> userList = <User>[].obs;

  Rx<User> activeUser = User().obs;

  RxInt productVideosCounts = 0.obs;
  RxBool isSale = false.obs;
  RxBool isExpanded = false.obs;


TextEditingController commentController  = TextEditingController();


  String token ='-1';
  String email ='-1';
  String name ='-1';
  int user_id = -1;
  String password ='-1';
  String image ='-1';
  String tel ='-1';

   late SharedPreferences pref;



  final Rx<CarouselController> carouselController = CarouselController().obs;
  final Rx<PageController> smoothController = PageController().obs;

  List<Widget> homeWidget =[
    const IndexWidget(),
    const BasketWidget(),
    const SearchWidget(),
  ];

  RxInt currentIndex = 0.obs;
  RxInt currentSlide = 0.obs;


  @override
 onInit() async {
    // TODO: implement onInit
    super.onInit();

    getToken();
    // getUser();
    // getActiveUser();
    getFrontApi();
    getSliderProduct();
    getAllProducts();
     // Get.find<FavoriteController>().getFavorite();
    getDiscount();
    getUserList();

  }

  // ***********************************Token*************************************

   getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token') ?? '-1';


  }

  Future<void> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token') ?? '-1';
    email = pref.getString('email') ?? '-1';
    name = pref.getString('name') ?? '-1';
    password = pref.getString('password') ?? '-1';
    user_id = pref.getInt('user_id') ?? -1;
    tel = pref.getString('tel') ?? '-1';
    image = pref.getString('image') ?? '-1';

  }

// ***********************************Slider*************************************
  changeIndex(index) {
    currentIndex.value = index;
    if (index == 1) {
      Get.find<BasketController>().basketProductList.clear();
      Get.find<BasketController>().showPageCart();
      // Get.toNamed(AppRouts.basketWidget);
    }
    if (index == 0) {
      productImageList.clear();
      populers.clear();
      productFrees.clear();
      getFrontApi();
      getSliderProduct();
      // Get.toNamed(AppRouts.indexWidget);
    }
  }

  onDotClick(int index) {
    currentSlide.value = index;
    carouselController.value.animateToPage(index);
  }

  void onChangeSlide(int index, CarouselPageChangedReason reason) {
    currentSlide.value = index;
  }

  getSliderProduct() async {
    try {
      Response response = await get(
        '${locallhost}/home',
      );

      if (response.statusCode! < 300) {
        if(response.body['productSliders']!= null){
          for (var item in response.body['productSliders']) {
            productImageList.add(Product.fromJson(item));
          }
          imageSlider.value = productImageList
              .map((item) => SliderWidget(product: item))
              .toList();
        }

      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

// ***********************************Index*************************************

  getFrontApi() async{
    // await getToken();
    try{
      newProducts.clear();
      productFrees.clear();
      populers.clear();
      categoryImages.clear();

      Response response = await get('${locallhost}/home');

      if(response.statusCode! < 300){

        if(response.body ['newProducts'] != null){
          for(var item in response.body['newProducts']){
            newProducts.add(Product.fromJson(item));
          }
        }


        if(response.body['productFrees'] != null){
          for(var item in response.body['productFrees']){
            productFrees.add(Product.fromJson(item));
          }
        }


        if(response.body['populers'] != null){
          for(var item in response.body['populers']){
            populers.add(Product.fromJson(item));
          }
        }

        if(response.body['categoreis'] != null){
          for(var item in response.body['categoreis']){
            categoryImages.add(Category.fromJson(item));
          }

        }



      }
    }
    catch(e,s){
      print(s);
    }
  }

// ***********************************Product*************************************

  Future<void> getAllProducts() async{
    try{
      Response response = await get('${locallhost}/home/product/all');
      if(response.statusCode! < 300){
        for(var item in response.body['allProducts']){
          allProducts.add(Product.fromJson(item));
        }

      }
      
    }
    catch(e,s){
      print(e);
      print(s);
    }
  }

  Future<void> getAllPopulars() async{
    try{
      Response response = await get('${locallhost}/home/product/allPopuler');
      if(response.statusCode! < 300){
        if(response.body['allPopuler']!=null){
          for(var item in response.body['allPopuler']) {
            allPopulars.add(Product.fromJson(item));
          }
        }

      }

    }
    catch(e,s){
      print(e);
      print(s);
    }
  }

  Future<void> getAllFrees() async{
    try{
      Response response = await get('${locallhost}/home/product/allFrees');
      if(response.statusCode! < 300){
        if(response.body['allFrees']!=null){
          for(var item in response.body['allFrees']){
            allFrees.add(Product.fromJson(item));
          }
        }


      }

    }
    catch(e,s){
      print(e);
      print(s);
    }
  }

  Future<void> previewProduct(int id) async {

    try {
      productCategory.clear();
      productVideo.clear();
      commentOfPtoduct.clear();
      commentOfPtoduct.clear();
      productVideosCounts.value = 0;


      Response response = await get(
        '${locallhost}/home/product/view/${id}',
      );

      if (response.statusCode! < 300) {

        if(response.body['product']!= null){
          productOne.value = Product.fromJson(response.body['product']);

        }

        if(response.body['productCategories']!= null){
          for (var item in response.body['productCategories']) {
            productCategory.add(ProductCategory.fromJson(item));
          }
        }

        if(response.body['productVideos']!= null){
          for (var item in response.body['productVideos']) {
            productVideo.add(ProductVideo.fromJson(item));
          }
        }

        if(response.body['comments']!= null){
          for (var item in response.body['comments']) {
            commentOfPtoduct.add(Comment.fromJson(item));
          }
        }

        productVideosCounts.value = response.body['productVideosCounts'];
        ProductSales(productOne.value.id!);
        Get.toNamed(AppRouts.previewProduct);
      }
    } catch (e, s) {
      print(e);
      print(s);
      StaticMethodes.unSuccesSnackBar(
          'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
    }
  }

  Future<void> ProductSales(int ProductId) async {

    // try {
      isSale.value = false;

      SharedPreferences pref = await SharedPreferences.getInstance();
      int? userId = pref.getInt('user_id');
      print(userId);
      print(ProductId);

      Response response = await get(
        '${locallhost}/productSales/${userId}/${ProductId}',
      );

      if (response.statusCode! < 300) {
        isSale.value = response.body['isSale'];
      }


    // } catch (e, s) {
    //   print(e);
    //   print(s);
    //   StaticMethodes.unSuccesSnackBar(
    //       'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
    // }
  }
// ***********************************Category*************************************

  Future<void> getAllCategory() async{
    try{
      Response response = await get('${locallhost}/home/Category/allCategory');
      if(response.statusCode!<300){
        print('allCategoreis');
        print(response.body['allCategoreis']);

        for(var item in response.body['allCategoreis']){
          allCategory.add(Category.fromJson(item));
        }

      }
      print('allCategory');
      print(allCategory);

    }
    catch(e,s){
      print(e);
      print(s);
    }
  }


  getCategoryProduct(int id) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      Response response = await get(
        '${locallhost}/home/Category/categoryView/${id}',
      );

      if (response.body['products'] != null) {
        for (var item in response.body['products']) {
          categoryProducts.add(Product.fromJson(item));
        }
      }
      // else {
      //   StaticMethodes.unSuccesSnackBar(
      //       'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
      // }
    } catch (e, s) {
      print(e);
      // StaticMethodes.unSuccesSnackBar(
      //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
    }
  }

// ***********************************User*************************************
  getActiveUser() async {
   await getToken();

    try{
      // if (token != '-1') {
      // SharedPreferences pref = await SharedPreferences.getInstance();
      //   int? userId = pref.getInt('user_id');
      //
        Response response = await get(
          '${locallhost}/activeUser',
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        );


        if(response.statusCode! < 300){
          if(response.body['user'] != null){
            activeUser.value = User.fromJson(response.body['user']);
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

  getDiscount() async{

    try {
      Response response = await get(
        '${locallhost}/discountList',
      );

      if (response.statusCode! < 300){
        if (response.body['discounts'] != null) {

          for (var item in response.body['discounts']) {
            discountList.add(Discount.fromJson(item));
          }

        }
      }

      else {
        // StaticMethodes.unSuccesSnackBar(
        //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');

      }
    } catch (e, s) {
      print(e);
      // StaticMethodes.unSuccesSnackBar(
      //     'مشکلی به وجود آمده لطفا دوباره تلاش کنید.');
    }

  }

  Future<void> getUserList() async{
    try{
      Response response = await get('${locallhost}/userList');
      if(response.statusCode! < 300){
        if(response.body['users'] != null){
          for(var item in response.body['users']){
            userList.add(User.fromJson(item));
          }
        }

      }

    }
    catch(e,s){
      print(e);
      print(s);
    }
  }
  Future<void> tickets() async{
    try{

      Response response = await get('${locallhost}/ticket/dashboard');


    }
    catch(e,s){
      print(e);
      print(s);
    }
  }

  // تابع برای باز کردن URL در مرورگر
  Future<void> launchURL(String url) async {
    print('object');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}