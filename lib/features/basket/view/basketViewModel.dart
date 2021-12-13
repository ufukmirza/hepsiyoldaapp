import 'package:flutter/cupertino.dart';
import 'package:hepsiyoldaapp/core/database/DatabaseHelper.dart';
import 'package:hepsiyoldaapp/features/basket/view/basket.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class basketViewModel extends  State<Basket>{
  List<Product> products = [];
  @override
  void initState() {
    getAllProducts();
  }

  Future<void> getAllProducts() async {

    Future<Database> dbFuture= DatabaseHelper().initializeDatabase();
    dbFuture.then((value) async {
      var results = await value.query("products", columns: Product.columns);
      results.forEach((result) {
        Product product = Product.fromJson(result);
        products.add(product);
      });
    });

setState((){});


  }


}