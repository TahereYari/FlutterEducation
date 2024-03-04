import 'package:educationsite/screens/all_category.dart';
import 'package:educationsite/screens/all_free_screen.dart';
import 'package:educationsite/screens/all_popular_screen.dart';
import 'package:educationsite/screens/all_product_screen.dart';
import 'package:educationsite/screens/logIn_screen.dart';
import 'package:educationsite/screens/myBasket_Screen.dart';
import 'package:educationsite/screens/my_favorite_screen.dart';
import 'package:educationsite/screens/product_category_screen.dart';
import 'package:educationsite/screens/preview_product2.dart';
import 'package:educationsite/screens/sales_screen.dart';
import 'package:educationsite/screens/signUp_screen.dart';
import 'package:educationsite/screens/splash_screen.dart';
import 'package:educationsite/screens/home_screen.dart';
import 'package:educationsite/screens/ticket/message_screen.dart';
import 'package:educationsite/screens/ticket/ticet_create.dart';
import 'package:educationsite/screens/ticket/ticket_home_screen.dart';
import 'package:educationsite/screens/user_profile_screen.dart';
import 'package:educationsite/screens/video_screen.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/basket_widget.dart';
import 'package:educationsite/widgets/index_widget.dart';
import 'package:get/get.dart';



class AppRouts{
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String indexWidget = '/indexWidget';
  static const String basketWidget = '/basketWidget';
  static const String allProductScreen = '/allProductScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String loginScreen = '/loginScreen';
  static const String allCategoryScreen = '/allCategoryScreen';
  static const String productCategory = '/productCategory';
  static const String allPopularProduct = '/allPopularProduct';
  static const String allFreesProduct = '/allFreesProduct';
  static const String favoriteScreen = '/favoriteScreen';
  static const String myBasketScreen = '/myBasketScreen';
  static const String saleScreen = '/saleScreen';
  static const String userProfileScreen = '/userProfileScreen';
  static const String previewProduct = '/previewProduct';
  static const String videoScreen = '/videoScreen';
  static const String ticketCreate = '/ticketCreate';
  static const String messageTicket = '/messageTicket';
  static const String ticketHomeScreen = '/ticketHomeScreen';

  static final List<GetPage> getPages = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: indexWidget, page: () => IndexWidget()),
    GetPage(name: basketWidget, page: () => BasketWidget()),
    GetPage(name: allProductScreen, page: ()=>AllProductScreen()),
    GetPage(name: signUpScreen, page: ()=>SignUpScreen()),
    GetPage(name: loginScreen, page: ()=>LogInScreen()),
    GetPage(name: allCategoryScreen, page: ()=>AllCategoryScreen()),
    GetPage(name: productCategory, page: ()=>ProductCategoryScreen()),
    GetPage(name: allPopularProduct, page: ()=>AllPopularScreen()),
    GetPage(name: allFreesProduct, page: ()=>AllFreesScreen()),
    GetPage(name: favoriteScreen, page: ()=>MyFavoriteScreen()),
    GetPage(name: myBasketScreen, page: ()=>MyBasketScreen()),
    GetPage(name: saleScreen, page: ()=>SaleScreen()),
    GetPage(name: userProfileScreen, page: ()=>UserProfile()),
    GetPage(name: previewProduct, page: ()=>PreviewProduct()),
    GetPage(name: videoScreen, page: ()=>VideoScreen()),
    GetPage(name: ticketCreate, page: ()=>TicketCreate()),
    GetPage(name: messageTicket, page: ()=>MessageScreen()),
    GetPage(name: ticketHomeScreen, page: ()=>TicketHomeScreen()),

  ];
}