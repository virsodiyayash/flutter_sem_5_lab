
import 'package:flutter_advance_lab/Lab_2/e_commerce/product.model.dart';

class ProductController{

  List<dynamic> productList = [
    Product(
        "Nike Waffle One Sneaker",
        "2000",
        "sneakers",
        "green",
        "Nike",
        "https://tse4.mm.bing.net/th?id=OIP._1HdprS91QjDO3Ls9HhWmgHaE8&pid=Api&P=0&h=180",
        false
   ),

    Product(
        "Nike Running Shoe",
        "1500",
        "sneakers",
        "black",
        "Adidas",
        "https://tse2.mm.bing.net/th?id=OIP.PA9No4Aqbih5FRUCGvtm5QHaE8&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Flat Slip On Pumps",
        "2100",
        "flats",
        "green",
        "Vans",
        "https://tse1.mm.bing.net/th?id=OIP.mNcR45ZaAuxavw6ptQoJdgHaEo&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Knit Ballet Flat",
        "1200",
        "flats",
        "black",
        "Adidas",
        "https://tse1.mm.bing.net/th?id=OIP.fKxFrG8dEACoZ-OTM_1s0QHaJR&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Nike Air Monarch IV",
        "2350",
        "sneakers",
        "white",
        "Nike",
        "https://images.pexels.com/photos/54334/running-shoe-shoe-brooks-highly-functional-54334.jpeg?cs=srgb&dl=shoe-sneakers-footwear-54334.jpg&fm=jpg",
        false
    ),

    Product(
        "Nike Air Vapormax Plus",
        "2110",
        "sneakers",
        "red",
        "Nike",
        "https://tse1.mm.bing.net/th?id=OIP.U_QfXuaYaEfDdy3KGga9RAHaE8&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Loafer Flats",
        "1750",
        "flats",
        "white",
        "Vans",
        "https://tse4.mm.bing.net/th?id=OIP.MhTUjAArNHjgTlp6N2kAOwHaJQ&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Nike Zoom Freak",
        "1400",
        "sneakers",
        "green",
        "Nike",
        "https://tse3.mm.bing.net/th?id=OIP.ptR2U1aI_hJt7VR5VOVGXgHaE8&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Nike Men's Sneaker",
        "1650",
        "sneakers",
        "blue",
        "Adidas",
        "https://tse4.mm.bing.net/th?id=OIP.hbA5n_CMdVo1fV0q3xQZfQHaHa&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "PUMA BLACK-OCE",
        "1900",
        "sneakers",
        "green",
        "Puma",
        "https://tse2.mm.bing.net/th?id=OIP.yjLMdDQH81pFkN_ow7s7WQHaJQ&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Pacer Future Sneaker",
        "1500",
        "sneakers",
        "red",
        "Puma",
        "https://tse2.mm.bing.net/th?id=OIP.TIWckpoCSJiDO_8U3qewegHaEh&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Unisex-Adult Super",
        "1999",
        "sneakers",
        "black",
        "Puma",
        "https://tse3.mm.bing.net/th?id=OIP.z9L4xZDwZhEozmngY3sGwwHaFs&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Roma Basic Sneaker",
        "1760",
        "sneakers",
        "white",
        "Puma",
        "https://tse2.mm.bing.net/th?id=OIP.h0PnJVWRWPsBvbsrTe7TpQHaE8&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Pacer Future Doubleknit",
        "1950",
        "sneakers",
        "black",
        "Puma",
        "https://tse3.mm.bing.net/th?id=OIP.lo76BM0GT_zmeAllzERJ3gHaEo&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Fusion Evo Golf Shoe",
        "1400",
        "sneakers",
        "green",
        "Puma",
        "https://tse2.mm.bing.net/th?id=OIP.Zs0wPVrK1LLVk42OQPfJzwHaEo&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Rainbow Chex Skate",
        "1850",
        "flats",
        "red",
        "Vans",
        "https://tse3.mm.bing.net/th?id=OIP.LU-G7-KEiM10AxQ5iUPrXQHaDk&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Low-Top Trainers",
        "2200",
        "sandals",
        "white",
        "Vans",
        "https://tse3.mm.bing.net/th?id=OIP.wMwcVXOKxx0B8C3c9bOwiAHaE8&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Vans Unisex Low-Top",
        "2350",
        "sandals",
        "blue",
        "Vans",
        "https://tse3.mm.bing.net/th?id=OIP.TTQmQMBo3hpkas3K9ac0gwHaFE&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Classic Bandana Sneakers",
        "3550",
        "sandals",
        "black",
        "Nike",
        "https://tse4.mm.bing.net/th?id=OIP.d-7UFbAaPsT2y3dYpaKm1AHaFb&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Chunky High Heel",
        "3700",
        "heels",
        "black",
        "Vans",
        "https://tse4.mm.bing.net/th?id=OIP.dtY1qot0pli5U2aQHALLtwHaHa&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Slip On Stiletto High Heel",
        "3300",
        "heels",
        "black",
        "Puma",
        "https://tse2.mm.bing.net/th?id=OIP.7LVyxqQJCvXwLUJdYtONMQHaJQ&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "DREAM PAIRS Court Shoes",
        "2900",
        "heels",
        "red",
        "Nike",
        "https://tse4.mm.bing.net/th?id=OIP.XYSB9N2nV4Qfe8zbcjOvOQHaHa&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Low Mid Block Heels",
        "2350",
        "heels",
        "black",
        "Nike",
        "https://tse3.mm.bing.net/th?id=OIP.gKcgKUVIAgFzHs7irf17lgHaEo&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Chunky High Heel",
        "2500",
        "heels",
        "black",
        "Adidas",
        "https://tse1.mm.bing.net/th?id=OIP.sWeifTk7ymCS7sVzYFSW-wHaEo&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Amore Fashion Stilettos",
        "2800",
        "heels",
        "white",
        "Adidas",
        "https://tse1.mm.bing.net/th?id=OIP.RYDGIDjwaBZwS29J8_B_GgHaHa&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Bridal Sandals Glitter",
        "2550",
        "heels",
        "black",
        "Adidas",
        "https://tse2.mm.bing.net/th?id=OIP.yZNYesJJ6gzmfzZrINErpgHaHa&pid=Api&P=0&h=180",
        false
    ),

    Product(
        "Wedding Prom Bridal",
        "3700",
        "flats",
        "black",
        "Adidas",
        "https://tse1.mm.bing.net/th?id=OIP.yYTFXVmlkNDj9kS-rBP-tQHaHa&pid=Api&P=0&h=180",
        false
    ),
  ];

  List<dynamic> cartList = [];

  void addToProductList(String title , String price , String category , String color , String company , String image , bool isFavourite){
    Product newProduct = Product(title, price, category, color, company, image , isFavourite);
    productList.add(newProduct);
  }

  void addToCart(int productIndex){
    if(productIndex >= 0 && productIndex < productList.length){
      cartList.add(productList[productIndex]);
    }
  }

  void removeFromCart(int cartIndex){
    if(cartIndex >= 0 && cartIndex < cartList.length){
      cartList.removeAt(cartIndex);
    }
  }

  void addToFavourite(int productIndex){
    if(productIndex >= 0 && productIndex < productList.length){
      productList[productIndex].isFavourite = !productList[productIndex].isFavourite;
    }
  }

}

final ProductController productController = ProductController();