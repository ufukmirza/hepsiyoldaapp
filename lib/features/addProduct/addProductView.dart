
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class AddProduct extends StatefulWidget{

  AddProductView createState()=>AddProductView();


}

class AddProductView extends State<AddProduct> {

  File? _imageFile;
  @override
  Widget build(BuildContext context) {


    CollectionReference products = FirebaseFirestore.instance.collection('shopping');

    final picker = ImagePicker();

    Future<void> pickImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      //Directory appDirectory = await getApplicationDocumentsDirectory();
      //File newImage = File(appDirectory.path + 'fileName');
      //newImage.writeAsBytes(File(pickedFile!.path).readAsBytesSync());
      print("saaaaaa"+ pickedFile!.path);
      setState(() {
        _imageFile = File(pickedFile!.path);
      });
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



    return Scaffold(
      //var product=Product(sId: "132153", name: "ahmet", image: "", total: 20, price: 30);
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          CircleAvatar(
            child: Stack(
                children: [
                  ClipOval(
                    child: (_imageFile != null)
                        ? Image.file(_imageFile!, fit: BoxFit.cover,width:50)
                        : Image.asset('images/newimage.png'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white70,
                      child: IconButton(icon: Icon(CupertinoIcons.camera), onPressed: () {
                        pickImage();
                      },),
                    ),
                  ),
                ]
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
Text(_imageFile!=null ? _imageFile!.path:"sa")
        ],
      ),
    );
  }
}
