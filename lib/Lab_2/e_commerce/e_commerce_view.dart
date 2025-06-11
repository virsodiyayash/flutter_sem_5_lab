import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_2/e_commerce/cart_items_page.dart';
import 'package:flutter_advance_lab/Lab_2/e_commerce/favourite_items_page.dart';
import 'package:flutter_advance_lab/Lab_2/e_commerce/product_controller.dart';

void main() {
  runApp(MaterialApp(
    home: ECommerceView(),
    debugShowCheckedModeBanner: false,
  ));
}

class ECommerceView extends StatefulWidget {
  const ECommerceView({super.key});

  @override
  State<ECommerceView> createState() => _ECommerceViewState();
}

class _ECommerceViewState extends State<ECommerceView>
    with TickerProviderStateMixin {

  late final TabController _tabController;
  TextEditingController searchController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: TabBar(
      //   tabs: [ECommerceView() , CartItemsPage()] ,
      //   controller: _tabController,
      //
      // ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20,),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  "My Myntra",
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  "shop ",
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
                // trailing: Badge(
                //   label: Text("${productController.cartList.length}"),
                //   isLabelVisible: true,
                //   child: IconButton(onPressed: (){
                //     print("Cart Button Pressed");
                //   }, icon: Icon(Icons.shopping_cart)),
                // ),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavouriteItemsPage()));
                    },
                    icon: Icon(Icons.favorite_border_outlined)),
                Badge(
                  label: Text("${productController.cartList.length}"),
                  isLabelVisible: true,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartItemsPage()));
                        print("Cart Button Pressed");
                      },
                      icon: Icon(Icons.shopping_cart)),
                )
              ],
            ),
            
              Expanded(
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisExtent: 400),
                  itemCount: productController.productList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 500,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              trailing: IconButton(onPressed: (){

                                productController.productList[index].isFavourite = !productController.productList[index].isFavourite;

                                setState(() {

                                });

                              }, icon: productController.productList[index].isFavourite
                                  ? Icon(Icons.favorite , color: Colors.red,)
                                  : Icon(Icons.favorite_border_outlined)),
                            ),
                            
                            Image.network(
                              "${productController.productList[index].image}" ,
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.height * 0.2,),
                            
                            ListTile(
                              title: Text("${productController.productList[index].title}"),
                              // subtitle: Text("price : ${productController.productList[index].price}" , style: TextStyle(color: Colors.blue),),
                              trailing:  CircleAvatar(
                                backgroundColor: Colors.blue[300],
                                child: IconButton(onPressed: (){
                                  productController.cartList.add(productController.productList[index]);
                                  setState(() {

                                  });
                                  print(productController.cartList);
                                }, icon: Icon(Icons.add))),
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
        ),
      ),
    );
  }
}
