import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{

  late String token;
  final String appBaseUrl;
  late Map <String,String> _header;
  ApiClient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    timeout=Duration(seconds: 30);
    token=AppConstants.TOKEN;
    _header={
     'Content_type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token'
    };

  }
  updateHeader(String token) {

    _header={
      'Content_type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token'
    };
  }

   Future<Response>getData( String uri) async {

    try{
      Response response=await get(uri);
      print("got uri and response");
      return response;
    }
       catch(e){
       return Response(statusCode: 1,statusText: e.toString());

        }
  }
  Future<Response>getLogin( String uri,dynamic body,) async {

    try{
      Response response=await post(uri,body,headers: _header);
      print("got uri and response");
      return response;
    }
    catch(e){
      return Response(statusCode: 1,statusText: e.toString());

    }
  }


}