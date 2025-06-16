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
                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
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
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisExtent: 380),
                  itemCount: productController.productList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      // height: MediaQuery.of(context).size.height * 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [  Color(0xFFFDFCFB),
                          Color(0xFFFFE5EC),],
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
                                borderRadius : BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(
                                  "${productController.productList[index].image}" ,
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              
                              Positioned(
                                  top: 10,
                                  right : 10,
                                  child: IconButton(onPressed: (){
                                    productController.productList[index].isFavourite = !productController.productList[index].isFavourite;

                                    setState(() {

                                    });
                                  }, icon: productController.productList[index].isFavourite
                                      ? Icon(Icons.favorite , color: Colors.red,)
                                      : Icon(Icons.favorite_border_outlined)),
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
                                  "₹${productController.productList[index].offerPrice}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "₹${productController.productList[index].price}",
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
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
