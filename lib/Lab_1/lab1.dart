class Student{

  String? name;
  int? rollNo;
  double? spi;

  Student(int rollNo , double spi , String name){
    this.name = name;
    this.spi = spi;
    this.rollNo = rollNo;
  }

  void displayDetails(){
    print("Hello, My name is ${name}, roll no is ${rollNo} and spi is ${spi}");
  }
}

void main(){
  Student sc = Student(318 , 9.52, "Yash");
  sc.displayDetails();
}