
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  XFile? _pickedFile;
   final controllerId = TextEditingController();
   final controllerName = TextEditingController();
   final controllerPrice = TextEditingController();
   final controllerTotal = TextEditingController();

  @override
  Widget build(BuildContext context) {


    CollectionReference products = FirebaseFirestore.instance.collection('shopping');

    final picker = ImagePicker();

    Future<void> pickImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      _pickedFile=pickedFile;
      //Directory appDirectory = await getApplicationDocumentsDirectory();
      //File newImage = File(appDirectory.path + 'fileName');
      //newImage.writeAsBytes(File(pickedFile!.path).readAsBytesSync());
      print("saaaaaa"+ pickedFile!.path);
      setState(() {
        _imageFile = File(pickedFile!.path);
      });
    }


    Future<void> addProduct(Product product) {
      // Call the user's CollectionReference to add a new user
      return products
          .add({
        'sId': product.sId, // John Doe
        'name': product.name, // Stokes and Sons
        'image': product.image,
        'total':product.total,
        'price':product.price,
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }



    return Scaffold(
      //resizeToAvoidBottomInset: false,
      //var product=Product(sId: "132153", name: "ahmet", image: "", total: 20, price: 30);
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.blue,
//                backgroundColor: Color(0xff476cfb),
                    child: ClipOval(
                      child: new SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: (_imageFile != null)
                            ? Image.file(
                          _imageFile!,
                          fit: BoxFit.fill,
                        )
                            : Image.network(
                          "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
             Padding(
               padding: EdgeInsets.only(bottom: 40),
               child: IconButton(
                 icon: Icon(
                 Icons.photo_camera,
                 size: 40,
                 ),
                 onPressed: () {
                    pickImage();
                 },
               ),
             ),
              ],
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: controllerId,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Urun ID sini Giriniz',
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller:controllerName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Urun ismini giriniz',
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller:controllerPrice,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Urun ucretini giriniz (sadece tam sayi)',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller:controllerTotal,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Urun adedini giriniz',
                ),
              ),
            ),
            Align(alignment:Alignment.bottomCenter,child:TextButton(onPressed: () async {
               String downloadUrl="";
              if ( _pickedFile!= null) {
                var ref = FirebaseStorage.instance.ref();
                var addImg = await ref.child("image/img").putFile(_imageFile!);
                if (addImg != null) {
                  downloadUrl =  await addImg.ref.getDownloadURL();
                }
              }
            await addProduct(Product(sId:controllerId.text,name:controllerName.text,image:downloadUrl,total:int.parse(controllerTotal.text),price:int.parse(controllerPrice.text)));
              Navigator.pop(context);

            },child: Text("Sat"),))
          ],
        )],
      ),
    );
  }
}
