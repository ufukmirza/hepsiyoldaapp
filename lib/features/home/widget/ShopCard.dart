import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/core/database/DatabaseHelper.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';
import 'package:hepsiyoldaapp/shopping/model/Shop.dart';
import 'package:provider/src/provider.dart';
import 'package:sqflite/sqflite.dart';

class ShopCard extends StatelessWidget {
  final Product product;
  const ShopCard({Key? key, required this.product}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(product.image)),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.shopping_cart_outlined),
                      color: Colors.white,
                      onPressed: () {

                        Future<Database> dbFuture= DatabaseHelper().initializeDatabase();
                        dbFuture.then((value){ value.insert("products", product.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);});

                         //  dbFuture.deleteDatabase();

                      }),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  IconButton buildIconButtonAdd(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_basket),
      onPressed: () {
        context.read<Shop>().addFirstItemToBasket(product);
      },
    );
  }

  Container buildContainerItem(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildIconButtonIncrement(context),
          Text("${context.watch<Shop>().basketProducts[product] ?? 0}"),
          buildIconButtonRemove(context),
        ],
      ),
    );
  }

  IconButton buildIconButtonIncrement(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        context.read<Shop>().incrementProduct(product);
      },
    );
  }

  IconButton buildIconButtonRemove(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.remove),
      onPressed: () {
        context.read<Shop>().increseProduct(product);
      },
    );
  }

  Wrap buildWrapSub() {
    return Wrap(
      spacing: 10,
      children: [
        Text(product.name),
        Text("${product.price}"),
      ],
    );
  }
}
