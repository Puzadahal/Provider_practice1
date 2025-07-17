import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:practice/model/post.dart';

class PostController extends ChangeNotifier {
  bool loader = false;

  setLoader(bool value) {
    loader = value;
    notifyListeners();
  }

  List<Post> postList = []; 
  bool hasInternet = false;

  setInternetConnection(bool value) {
    hasInternet = value;
    notifyListeners();
  }

  getPost() async {
    if( await checkInternetConnection()==true){
    setInternetConnection(true);
    setLoader(true);
    try {
      Dio dio = Dio();
      Response response = await dio.get("https://dummyjson.com/posts");

     
      List<dynamic> data = response.data['posts'];
      postList = data.map((e) => Post.fromJson(e)).toList();

      setLoader(false);
      notifyListeners();
    } catch (e) {
      print(e);
      setLoader(false);
    }
    }else{
      setInternetConnection(false);
      setLoader(false);
    }
  }


  checkInternetConnection() async {
    bool result = await InternetConnection().hasInternetAccess;
    return result;
  }
}
