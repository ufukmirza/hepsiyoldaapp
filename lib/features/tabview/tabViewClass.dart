import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/features/basket/view/basketPage.dart';
import 'package:hepsiyoldaapp/features/home/view/homePage.dart';

class tabViewClass extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: buildBottomAppBar(context),
          body: TabBarView(children: [
            homePage(),
            basketPage()
          ]),
        ));
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
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