import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_2/e_commerce/e_commerce_view.dart';
import 'package:flutter_advance_lab/Lab_2/e_commerce/product_controller.dart';

import 'favourite_items_page.dart';

class CartItemsPage extends StatefulWidget {
  const CartItemsPage({super.key});

  @override
  State<CartItemsPage> createState() => _CartItemsPageState();
}

class _CartItemsPageState extends State<CartItemsPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // print(productController.cartList[0]);

    return Scaffold(
        body: productController.cartList.isNotEmpty ? Form(
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

                SizedBox(
                  height: 10,
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

                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavouriteItemsPage()));
                        },
                        icon: Icon(Icons.favorite_border_outlined)),

                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ECommerceView()));
                    }, icon: Icon(Icons.home))
                  ],
                ),

                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisExtent: 400),
                    itemCount: productController.cartList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 500,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                trailing: IconButton(onPressed: (){

                                  var elementOfCart = productController.cartList[index];

                                  elementOfCart.isFavourite = !elementOfCart.isFavourite;

                                  setState(() {

                                  });

                                  print(productController.cartList[index].isFavourite);


                                }, icon: productController.cartList[index].isFavourite ?
                                Icon(Icons.favorite , color: Colors.red,) : Icon(Icons.favorite_border_outlined)),
                              ),

                              Image.network(
                                "${productController.cartList[index].image}" ,
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.height * 0.2,),

                              ListTile(
                                title: Text("${productController.cartList[index].title}"),
                                // subtitle: Text("price : ${productController.productList[index].price}" , style: TextStyle(color: Colors.blue),),
                                trailing:  CircleAvatar(
                                    backgroundColor: Colors.red[500],
                                    child: IconButton(onPressed: (){
                                      // productController.cartList.add(productController.productList[index]);
                                      // setState(() {
                                      //
                                      // });
                                      
                                      showDialog(context: context, builder: (BuildContext context){
                                        return AlertDialog(
                                          title: Text("Remove ${productController.cartList[index]}"),
                                          content: Text("Are you sure you want to remove this item from the cart?"),
                                          actions: [
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, child: Text("Cancel")),
                                            
                                            TextButton(onPressed: (){
                                              setState(() {
                                                productController.cartList.removeAt(index);
                                              });
                                              Navigator.pop(context);
                                            }, child: Text("Delete" , style: TextStyle(color: Colors.red),))
                                          ],
                                        );
                                      });


                                      print(productController.cartList);
                                    }, icon: Icon(Icons.delete , color: Colors.black87,))),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("price : ${productController.productList[index].price}" , style: TextStyle(color: Colors.blue),),
                              )

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ))
            : Column(
              children: [
                Center(
                child: Text("Your cart is empty" , style: TextStyle(fontSize: 20 , color: Colors.black38),)),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ECommerceView()));
                }, child: Text("Back to home" , style: TextStyle(color: Colors.blue , fontSize: 16),))
              ],
            ),
    );
  }
}
