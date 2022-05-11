import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeaders;
  //for storing data locally - key pair value

  ApiClient({required this.appBaseUrl}){  //creating constructor
    baseUrl= appBaseUrl; //getX package mgt system should know baseurl
    timeout = Duration(seconds: 30); // how long it should try to get data from the server - 30sec stop aferwards
    token=AppConstants.TOKEN;
    _mainHeaders= {  //basic headers should be given
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async {   //needs URI
    try{
     Response response = await get(uri);
     return response;
    } catch(e){  //error - if it fails send status code and error msg
      print("hi");
      return Response(statusCode:1, statusText: e.toString());
    }
  }
}