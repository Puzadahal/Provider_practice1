import 'package:flutter/material.dart';
import 'package:practice/provider/product_controller.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
@override
  void initState() {
   getValueFromAPi();
    super.initState();
  }

  getValueFromAPi(){
     Future.microtask(() async{
    final productController = Provider.of<ProductController>(context, listen: false);
    await productController.getProduct();
   
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProductController>(
        builder: (context, productController, child) => 
        productController.productList.isEmpty ? Text("No data") : 
         Expanded(
           child: ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context,index)=>
                   Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product name is ${productController.productList[index].title}"),
                 Text("Product price is ${productController.productList[index].price}"),
                 Image.network(productController.productList[index].image ?? "")
              ],
            ),
                   )
                   ),
         )
         
      ),
    );
  }
}