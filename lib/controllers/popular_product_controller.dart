import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList=[];
  List<ProductModel> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList(); //opens a future task so we need await
    print(response.statusCode);
    if(response.statusCode == 200){
        print("got products");
        _popularProductList=[];
        _popularProductList.addAll(Product.fromJson(response.body).products);
        //print(_popularProductList);//_popularProductList.addAll();  //need to convert json data to a model
        update(); // like setstate()
      }else{
      print("error : ${response}");
    }
  }
}