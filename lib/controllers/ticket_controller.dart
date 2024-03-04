import 'dart:async';
import 'dart:io';

import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/models/basket.dart';
import 'package:educationsite/models/basketProduct.dart';
import 'package:educationsite/models/message.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/models/ticket.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

class TicketController extends GetxController {
  TextEditingController titileController = TextEditingController();
  TextEditingController messagefirstController = TextEditingController();
  TextEditingController sendMessageController = TextEditingController();

  RxList<Product> myProductList = <Product>[].obs;
  RxList<Basket> myBasketsList = <Basket>[].obs;
  RxList<BasketProduct> basketproducts = <BasketProduct>[].obs;
   List<Message> messageList = <Message>[].obs;
  Rx<Ticket> openticket = Ticket().obs;
  Rx<Ticket> currentTicket = Ticket().obs;


     final messagesController = StreamController<List<Message>>.broadcast();
    Stream<List<Message>> get messagesStream  => messagesController.stream;

    // StreamController<List<Message>> messageStreamController = StreamController<List<Message>>();

  RxInt dropDownValue = 62.obs;
  RxList<DropdownMenuItem<int>> dropdownMyProductList =
      <DropdownMenuItem<int>>[].obs;

  late SharedPreferences pref;
  String token = '-1';
  late String supportName;
  // late PusherClient pusher;

  @override
  onInit() async {
    // TODO: implement onInit
    super.onInit();
    getCurrentTicket();
    getToken();
    getmessages();

    // messageList.clear();

    // pusher = PusherClient(
    //   '1694409',
    //   PusherOptions(
    //     cluster: 'ap1',
    //     encrypted: true,
    //   ),
    // );
    //
    // pusher.onConnectionStateChange((state) {
    //   print('Connection state changed: $state');
    // });
    //
    // pusher.connect();
    //
    // // Subscribe to the channel where pusher messages are sent
    // var channel = pusher.subscribe('chatSupport');
    // channel.bind('chat-event', (event) {
    //   // Handle the received event (message) here
    //   print('Received message from pusher: $event');
    //   // Update the UI with the received message
    // });


  }

  // @override
  // void dispose() {
  //   messagesController.close();
  //   pusher.disconnect();
  //   super.dispose();
  // }

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token') ?? '-1';
  }

  // Future<void> getProductList() async {
  //   try {
  //     // getBasketProduct();
  //     myBasketsList.clear();
  //     myProductList.clear();
  //     basketproducts.clear();
  //
  //    await getToken();
  //     dio.Dio myDio = dio.Dio();
  //     dio.Response response = await myDio.get(
  //       '${locallhost}/ticket/getBaskets',
  //       options: dio.Options(
  //         headers: {
  //           HttpHeaders.authorizationHeader: 'Bearer $token',
  //         },
  //         method: 'Get',
  //         responseType: dio.ResponseType.json,
  //       ),
  //     );
  //
  //     if (response.statusCode! < 300) {
  //       if(response.data['userBaskets'] != null){
  //         for (var item in response.data['userBaskets']) {
  //           myBasketsList.add(Basket.fromJson(item));
  //         }
  //       }
  //
  //
  //       if(response.data['allProductList'] != null){
  //         for (var item in response.data['allProductList']) {
  //           myProductList.add(Product.fromJson(item));
  //         }
  //       }
  //
  //
  //       for (var basket in myBasketsList){
  //
  //           BasketProduct? basketproduct =
  //               this.basketproducts
  //               .where((bp) => bp.basketId == basket.id)
  //               .firstOrNull;
  //
  //           print('basketproduct');
  //           print(basketproduct?.basketId);
  //
  //          if(basketproduct != null){
  //
  //            Product? product =
  //                this.myProductList
  //                    .where((p) => p.id == basketproduct.productId)
  //                    .firstOrNull;
  //            print('product');
  //            print(product?.name);
  //
  //            if(product != null){
  //              var dropDownItem = DropdownMenuItem(
  //                value: product.id,
  //                child: Text(product.name!),
  //              );
  //
  //              dropdownMyProductList.add(dropDownItem);
  //
  //            }
  //          }
  //
  //           // for (var item in myProductList) {
  //
  //             // var dropDownItem = DropdownMenuItem(
  //             //   value: item.id,
  //             //   child: Text(item.name!),
  //             // );
  //             //
  //             // dropdownMyProductList.add(dropDownItem);
  //           // }
  //
  //
  //       }
  //
  //
  //
  //
  //
  //     }
  //   } catch (e, s) {
  //     print(e);
  //     print(s);
  //   }
  // }

  Future<void> getProductList() async {
    try {
      // getBasketProduct();



      await getToken();
      dio.Dio myDio = dio.Dio();
      dio.Response response = await myDio.get(
        '${locallhost}/ticket/getBaskets',
        options: dio.Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          method: 'Get',
          responseType: dio.ResponseType.json,
        ),
      );

      if (response.statusCode! < 300) {


        if(response.data['allProductList'] != null){
          for (var item in response.data['allProductList']) {
            myProductList.add(Product.fromJson(item));
          }

          for (var item in myProductList) {
            var dropDownItem = DropdownMenuItem(
              value: item.id,
              child: Text(item.name!),
            );
            dropdownMyProductList.add(dropDownItem);
          }
        }
      }

    } catch (e, s) {
      print(e);
      print(s);
    }
  }
  Future<void> getBasketProduct() async {
    try {
      basketproducts.clear();
      await getToken();
      dio.Dio myDio = dio.Dio();
      dio.Response response = await myDio.get(
        '${locallhost}/ticket/getBasketProducts',
        options: dio.Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          method: 'Get',
          responseType: dio.ResponseType.json,
        ),
      );

      if (response.statusCode! < 300) {
        if(response.data['basketProducts'] != null){
          for (var item in response.data['basketProducts']) {
            basketproducts.add(BasketProduct.fromJson(item));
          }

        }



      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<void> insertTicket() async{

    if (token == '-1') {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اچازه دسترسی به این قسمت را ندارید');
    }
    else {
      try {
        String title = titileController.text;
        String message = messagefirstController.text;

        int productId = dropDownValue.value!;

        Map<String, dynamic> newMap = {};

        newMap['title'] = title;
        newMap['message'] = message;

        newMap['product'] = productId;

        if (StaticMethodes.validateInput(title, 'عنوان تیکت') &&
            StaticMethodes.validateInput(message, 'پیغام')) {


          dio.Dio myDio = dio.Dio();
          dio.FormData formData = dio.FormData.fromMap(newMap);
          dio.Response response = await myDio.post(
            '${locallhost}/ticket/insert',
            data: formData,
            options: dio.Options(
                headers: {HttpHeaders.authorizationHeader:'Bearer $token'},
                method: 'POST',
                responseType: dio.ResponseType.json,
                followRedirects: false,
                validateStatus:
                    (status)  => true
                // {
                //   return status! < 500;
                // }
                ),
          );


          // print(response.data['id']);

          print(response.data);
          reset();
          if (response.data != '') {
            getmessages();
            Get.toNamed(AppRouts.messageTicket);

            // StaticMethodes.SuccesSnackBar('اطلاعات شما با موفقیت ذخیره شد.');
            reset();
            // print(response.data);

            // Future.delayed(const Duration(seconds: 5),() async{
            //   Get.back;
            // });
            //  Get.toNamed(AppRouts.AddProductPicture ,arguments: id);
          }
        }
        // else {
        //   StaticMethodes.errorSnackBar('خطا', 'نام محصول تکراری می باشد.');
        // }
      } catch (e, s) {
        print(e);
        print(s);
        // StaticMethodes.unSuccesSnackBar('مشکلی در ذخیره اطلاعات به وجود آمده.');
        //reset();
        // Future.delayed(const Duration(seconds: 5),() async{
        //   Get.back;
        // });
        print(e);
      }
    }

  }

  Future<void> sendMessage(int ticketId) async{

    if (token == '-1') {
      StaticMethodes.errorSnackBar(
          'خطا', 'شما اچازه دسترسی به این قسمت را ندارید');
    }
    else {
      try {
        String message = sendMessageController.text;




        Map<String, dynamic> newMap = {};


        newMap['message'] = message;



        // if (StaticMethodes.validateInput(title, 'عنوان تیکت') &&
        //     StaticMethodes.validateInput(message, 'پیغام')) {


          dio.Dio myDio = dio.Dio();
          dio.FormData formData = dio.FormData.fromMap(newMap);
          dio.Response response = await myDio.post(
            '${locallhost}/ticket/sendMessage/${ticketId}',
            data: formData,
            options: dio.Options(
                headers: {HttpHeaders.authorizationHeader:'Bearer $token'},
                method: 'POST',
                responseType: dio.ResponseType.json,
                followRedirects: false,
                validateStatus:
                    (status)  => true
              // {
              //   return status! < 500;
              // }
            ),
          );

          print(response.data);
        sendMessageController.clear();

         messageList =  getmessages() as List<Message>;
        // getmessages();
        messageList.add(response.data);
          messagesController.add(messageList);
        // messagesStream.add(messageList);







        // }

      } catch (e, s) {
        print(e);
        print(s);
        // StaticMethodes.unSuccesSnackBar('مشکلی در ذخیره اطلاعات به وجود آمده.');
        //reset();
        // Future.delayed(const Duration(seconds: 5),() async{
        //   Get.back;
        // });
        print(e);
      }
    }

  }

  Future<void> getmessages() async {
    try {
       Future.delayed(Duration(seconds: 2),() async{

        messageList.clear();
        await getToken();
        dio.Dio myDio = dio.Dio();
        dio.Response response = await myDio.get(
          '${locallhost}/ticket/getMessages',
          options: dio.Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $token',
            },
            method: 'Get',
            responseType: dio.ResponseType.json,
          ),
        );

        if (response.statusCode! < 300) {
          if(response.data['messages'] != null){
            for (var item in response.data['messages']) {
              messageList.add(Message.fromJson(item));
            }

            // messageList.addAll(Message.fromJson(response.data['messages']) as Iterable<Message>);
            messagesController.add(messageList);

          }

          if(response.data['openticket'] != null){
            openticket.value = Ticket.fromJson(response.data['openticket']);

          }
          if(response.data['support'] != null){
            supportName = response.data['support'];
          }

        }
        messagesController.add(messageList);

     });
    } catch (e, s) {
      print(e);
      print(s);
    }

  }

  Future<void> ticketClose() async{

    try{
      dio.Dio myDio = dio.Dio();
      dio.Response response = await myDio.get(
        '${locallhost}/ticket/close',
        options: dio.Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          method: 'Get',
          responseType: dio.ResponseType.json,
        ),
      );
      StaticMethodes.SuccesSnackBar('تیکت شما بسته شد . ');
      Get.toNamed(AppRouts.homeScreen);
    }
    catch(e,s){
      print(e);
      print(s);
    }
  }

  Future<void> getCurrentTicket() async{

    try{
     await getToken();
      dio.Dio myDio = dio.Dio();
      dio.Response response = await myDio.get(
        '${locallhost}/ticket/currentTicket',
        options: dio.Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          method: 'Get',
          responseType: dio.ResponseType.json,
        ),
      );

     if(response.statusCode! < 300){
        if(response.data['currentticket'] != null){
         currentTicket.value = Ticket.fromJson(response.data['currentticket']);

        }

     }
    }
    catch(e,s){
      print(e);
      print(s);
    }
  }



  void reset() {
    titileController.clear();
    messagefirstController.clear();

  }
}
