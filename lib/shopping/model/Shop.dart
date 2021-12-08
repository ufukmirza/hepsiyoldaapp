import 'package:flutter/cupertino.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';
import 'package:hepsiyoldaapp/shopping/service/shoppingService.dart';
import 'package:provider/src/provider.dart';

class Shop extends ChangeNotifier {
  Map<Product, int> basketProducts = {};

  late ShoppingService service;

  Shop(BuildContext context) {
    service = context.read<ShoppingService>();
  }

  List<Product> get basketItems => basketProducts.keys.toList();

  double get basketTotalMoney {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      basketProducts.forEach((key, value) {
        _total += key.price * value;
      });
      return _total;
    }
  }

  int get totalProduct {
    return basketProducts.length;
  }

  void addFirstItemToBasket(Product product) {
    basketProducts[product] = 1;
   // service.addProduct(product);
    notifyListeners();
  }

  void incrementProduct(Product product) {
    if (basketProducts[product] == null) {
      addFirstItemToBasket(product);
      return;
    } else
      basketProducts[product]=basketProducts[product]!+1;
    notifyListeners();
  }

  void increseProduct(Product product) {
    if (basketProducts[product] == null) return;
    if (basketProducts[product] == 0) {
      basketProducts.removeWhere((key, value) => key == product);
    } else {
      basketProducts[product]=basketProducts[product]!-1;
    }
    notifyListeners();
  }
}