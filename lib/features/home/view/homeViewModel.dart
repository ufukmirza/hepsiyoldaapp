
import 'package:flutter/cupertino.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';
import 'package:hepsiyoldaapp/features/home/view/home.dart';
import 'package:hepsiyoldaapp/shopping/service/shoppingService.dart';
import 'package:provider/src/provider.dart';

 abstract class homeViewModel extends State<Home> {
  List<Product> products = [];

  @override
  void initState() {
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    products = await context.read<ShoppingService>().getAllProducts();
    print(products[0].name);

    setState(() {});
  }


}