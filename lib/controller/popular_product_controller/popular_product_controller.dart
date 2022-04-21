import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/popular_product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
    PopularProductRepo popularProductRepo;

    PopularProductController( { required this.popularProductRepo});

    List <dynamic> _popularProductList=[];   ///private variable so that when I need to read it from ui
   List <dynamic> get popularProductList=>_popularProductList;  ///For Ui I need to this

    Future <void> getPopularProductList()async {
      Response response=await popularProductRepo.getPopularProductList();
         if(response.statusCode==200){
           _popularProductList=[];
           print("got it");
           _popularProductList.addAll(Products.fromJson(response.body).products!.toList(growable: true));
           update();
         }
         else{
      print(response.status);
         }

    }


}