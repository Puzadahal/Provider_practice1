import 'package:flutter/material.dart';

class ConfirmPasswordprovider  extends ChangeNotifier{
  bool security=false;
  ConfirmPassword(){
 security=!security;
    notifyListeners();
}
}