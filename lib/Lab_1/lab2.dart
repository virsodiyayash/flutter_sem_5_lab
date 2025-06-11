class Car{

  int? noOfTyres;
  String? color;

}

class Verna extends Car{

  Verna(int noOfTyres , String color){
    this.noOfTyres = noOfTyres;
    this.color = color;
  }

  void displayDetails(){
    print("The color of the car is ${color} and the number of tyres of the car is ${noOfTyres}");
  }

}

void main(){
  Verna verna = Verna(4 , "White");
  verna.displayDetails();
}
