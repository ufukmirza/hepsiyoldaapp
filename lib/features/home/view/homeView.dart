
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/features/home/widget/ShopCard.dart';

import 'homeViewModel.dart';

class homeView extends homeViewModel {
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

  // Widget buildActionChipTotalMoney(BuildContext context) {
  //
  //   return ActionChip(
  //     avatar: Icon(Icons.check, color: Colors.green),
  //     label: Text("${context.watch<User>().basketTotalMoney} TL"),
  //     onPressed: () {
  //       // TODO: Define user press
  //     },
  //   );
  // }
}
