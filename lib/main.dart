import 'package:flutter/material.dart';
import 'package:practice/no_internet_connection.dart';
import 'package:practice/post_details.dart';
import 'package:practice/provider/login_provider.dart';
import 'package:practice/provider/post_provider.dart';
import 'package:practice/provider/product_controller.dart';
import 'package:provider/provider.dart';
import 'provider/confirm_passwordProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => LoginProvider()),
          ChangeNotifierProvider(create: (context) => ProductController()),
          ChangeNotifierProvider(create: (context) => PostController()),
          ChangeNotifierProvider(create: (context) => ConfirmPasswordprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: PostDetails()),
    );
  }
}
