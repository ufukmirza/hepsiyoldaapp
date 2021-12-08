import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';

class ShoppingService {
  // late Dio dio;
  //
  // ShoppingService() {
  //   dio = Dio(BaseOptions(baseUrl:"https://97976a94-17de-4700-bf7d-1d2d32d481c6.mock.pstmn.io"));
  // }
  //
  // Future<List<Product>> getAllProducts() async {
  //   final response = await dio.get("/shop");
  //
  //   if (response.statusCode == HttpStatus.ok) {
  //     List responseBody = jsonDecode(response.data);
  //     print(responseBody);
  //     return responseBody.map((e) => Product.fromJson(e)).toList();
  //   }
  //
  //   throw Exception();
  // }
  //
  // Future<bool> addProduct(Product product) async {
  //   final response = await dio.post("/product", data: product.toJson(), options: Options(headers: {"user-id": "5fbd48380fe34c4b213dfe6b"}));
  //
  //   if (response.statusCode == HttpStatus.ok) {
  //     return true;
  //   }
  //
  //   return false;
  // }

  Future<List<Product>> getAllProducts() async {
    // StreamBuilder<QuerySnapshot>(
    //     stream: FirebaseFirestore.instance.collection('shopping').snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.waiting:
    //           return new Text('Loading...');
    //         default:
    //               () {
    //             return snapshot.data!.docs.map((DocumentSnapshot document) {
    //               Product(
    //                 sId: document["sId"],
    //                 image: document["image"],
    //                 name: document["name"],
    //                 price: document["price"],
    //                 total: document["total"],
    //               );
    //             }).toList();
    //           };
    //       };
    //     });

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("shopping").get();
    List<Product> products=[];
    var list = querySnapshot.docs;
    list.forEach((element) {
      products.add(Product(sId: element["sId"],name:element["name"],image:element["image"],price:element["price"],total:element["total"]));
      print(element.data());
    });

return products;
  }
}
