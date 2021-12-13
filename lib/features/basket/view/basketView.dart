import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hepsiyoldaapp/features/basket/view/basketViewModel.dart';
import 'package:hepsiyoldaapp/features/home/widget/ShopCard.dart';

class basketView extends basketViewModel{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ShopCard(product: products[index]);
        },
      ),
    );


  }




}