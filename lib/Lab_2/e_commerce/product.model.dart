class Product{
  String? title;
  String? price;
  String? category;
  String? color;
  String? company;
  String? image;
  bool isFavourite = false;

  Product(this.title , this.price , this.category , this.color , this.company , this.image , [this.isFavourite = false]);
}