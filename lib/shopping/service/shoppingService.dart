
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';

class ShoppingService {
  late Dio dio;

  ShoppingService() {
    dio = Dio(BaseOptions(baseUrl:"https://97976a94-17de-4700-bf7d-1d2d32d481c6.mock.pstmn.io"));
  }

  Future<List<Product>> getAllProducts() async {
    final response = await dio.get("/shop");

    if (response.statusCode == HttpStatus.ok) {
      List responseBody = jsonDecode(response.data);
      print(responseBody);
      return responseBody.map((e) => Product.fromJson(e)).toList();
    }

    throw Exception();
  }

  Future<bool> addProduct(Product product) async {
    final response = await dio.post("/product", data: product.toJson(), options: Options(headers: {"user-id": "5fbd48380fe34c4b213dfe6b"}));

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }
}