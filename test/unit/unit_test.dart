
import 'package:flutter_test/flutter_test.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';

void main() {

  Product? product;

  setUp((){

    product=Product(name:"halter",image: "halter.jpg",sId:"14",total: 15,price:15);

  });

  test('product name test', (){


    expect(product!.name,"halter");

  });

  test('product total test', (){


    expect(product!.name,"halter");

  });
}
