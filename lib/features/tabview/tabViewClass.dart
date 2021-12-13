import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/components/appBar.dart';
import 'package:hepsiyoldaapp/features/addProduct/addProductView.dart';
import 'package:hepsiyoldaapp/features/basket/view/basketPage.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';
import 'package:hepsiyoldaapp/features/home/view/home.dart';
import 'package:hepsiyoldaapp/features/home/view/homeView.dart';
import 'package:image_picker/image_picker.dart';

class tabViewClass extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {

    CollectionReference products = FirebaseFirestore.instance.collection('shopping');

    void _openCamera(BuildContext context)  async{
      final ImagePicker _picker = ImagePicker();
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    }


    Future<void> addProduct() {
      // Call the user's CollectionReference to add a new user
      return products
          .add({
        'sId': "222", // John Doe
        'name': "company", // Stokes and Sons
        'image': "https://cdn.dsmcdn.com/mnresize/400/-/ty128/product/media/images/20210610/17/98485339/56271075/1/1_org.jpg",
        'total':25,
        'price':52,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }


    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
             //print("wqwas");
             //_openCamera(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProduct()),
              );
             //addProduct();

            },
            tooltip: 'Add Transaction',
            backgroundColor: Colors.orange[300],
            foregroundColor: Colors.black87,
            child: Icon(Icons.add),
            elevation: 2.0,
          ),
          appBar: appBar(context:context),
          bottomNavigationBar: buildBottomAppBar(context),
          body: TabBarView(children: [
            Home(),
            basketPage()
          ]),
        ));
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
       shape: CircularNotchedRectangle(),
        elevation: 20,
        child: TabBar(
          indicatorPadding: const EdgeInsets.only(left: 50.0,right: 50.0),
          labelStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.tealAccent[700]),
          tabs: [
            Tab(icon: Column(children:[Icon(Icons.home),Text("Home")] )),
            Tab(
              icon: Column(
                children: [
                  Icon(Icons.shopping_basket),
             Text("My Basket")
                ],
              ),
            )
          ],
          labelColor: Colors.white,
        ));
  }


}