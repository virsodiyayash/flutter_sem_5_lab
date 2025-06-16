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


  List<dynamic> favouriteProductList = productController.productList.where((product) => product.isFavourite).toList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.04
                ),
                title: Text(
                  "My Shop",
                  style: TextStyle(fontSize: 20 , color: Colors.white),
                ),
                subtitle: Text(
                  "Step Into Style",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
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

              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2 , mainAxisExtent: 400),
                        itemCount: favouriteProductList.length,
                        itemBuilder: (BuildContext context , index){
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFDFCFB),
                                      Color(0xFFFFE5EC),
                                    ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15)
                                          ),
                                          child: Image.network(
                                            "${favouriteProductList[index].image}",
                                            height: MediaQuery.of(context).size.height * 0.25,
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                
                                        Positioned(
                                            top: 10,
                                            right: 10,
                                            child: IconButton(onPressed: (){
                                              favouriteProductList[index].isFavourite = false;
                                              favouriteProductList.removeAt(index);

                                              setState(() {

                                              });
                                            }, icon: Icon(Icons.favorite , color: Colors.red,))
                                        )
                                      ],
                                    ),

                                  ListTile(
                                    title: Text("${productController.productList[index].title}"),
                                    // subtitle: Text("price : ${productController.productList[index].price}" , style: TextStyle(color: Colors.blue),),
                                    trailing:  CircleAvatar(
                                        backgroundColor: Colors.blue[300],
                                        child: IconButton(onPressed: (){
                                          productController.cartList.add(productController.productList[index]);
                                          setState(() {

                                          });
                                          // print(productController.cartList);
                                        }, icon: Icon(Icons.add))),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "₹${favouriteProductList[index].offerPrice}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "₹${favouriteProductList[index].price}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                        }),
              )
          // Expanded(child: Center(child: Text("Favourite Page" , style: TextStyle(fontSize: 20 , color: Colors.black38),)))
        ],
      )),
    );
  }
}
