import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_2/e_commerce/cart_items_page.dart';
import 'package:flutter_advance_lab/Lab_2/e_commerce/product_controller.dart';

import 'e_commerce_view.dart';

class FavouriteItemsPage extends StatefulWidget {
  const FavouriteItemsPage({super.key});

  @override
  State<FavouriteItemsPage> createState() => _FavouriteItemsPageState();
}

class _FavouriteItemsPageState extends State<FavouriteItemsPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
          child: Column(
        children: [
          SizedBox(height: 20,),
          Card(
            elevation: 5,
            child: ListTile(
              title: Text("My Myntra" , style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                "shop ",
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
            ),
          ),

          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Card(
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "Search here what you want",
                        hintStyle:
                        TextStyle(fontSize: 14, color: Colors.black38),
                        prefixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black12))),
                  ),
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * .02,
              ),

              Badge(
                label: Text("${productController.cartList.length}"),
                isLabelVisible: true,
                child: IconButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartItemsPage()));
                }, icon: Icon(Icons.shopping_cart)),
              ),

              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ECommerceView()));
              }, icon: Icon(Icons.home))
            ],
          ),

          Expanded(child: Center(child: Text("Favourite Page" , style: TextStyle(fontSize: 20 , color: Colors.black38),)))
        ],
      )),
    );
  }
}
