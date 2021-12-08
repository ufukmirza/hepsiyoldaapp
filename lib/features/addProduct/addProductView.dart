import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';

class AddProductView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Center(

child: TextButton(onPressed: () {

  var product=Product(sId: "132153", name: "ahmet", image: "", total: 20, price: 30);

}, child: Text("sa"),),


      ),
    );

  }
}