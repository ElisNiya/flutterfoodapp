import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

//how to lead repositories

Future<void> init() async {
//api Client
Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));  //first we need to load apiclient dependency

//repos
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

//controllers
Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}