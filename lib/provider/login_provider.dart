import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
    bool showPassword=false;
    togglePasswordVisibility(){
    //   if(showPassword==true){
    //     showPassword=false;
    //   }
    //   else{
    //     showPassword=true;
    //   }
    //   notifyListeners();


    showPassword=!showPassword;
    notifyListeners();
    }

}