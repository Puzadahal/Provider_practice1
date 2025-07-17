import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practice/model/product.dart';

class  ProductController extends ChangeNotifier{
  bool loader=false;

  setLoader(bool value){
    loader=value;
    notifyListeners();
  }
  List<Product> productList=[];  

  getProduct()async{
    setLoader(true);
   try{
     Dio dio= Dio();
     Response response=await dio.get("https://fakestoreapi.com/products");
    productList.addAll((response.data as List).map((e) => Product.fromJson(e)).toList());
   setLoader(false);
   notifyListeners();
   }catch(e){
    print(e);
       setLoader(false);
   }
    
  }

}