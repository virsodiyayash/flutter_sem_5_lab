class Student{

  void playing(){
    print("Students are playing with (STUDENT CLASS)");
  }

}

class Child extends Student{

  void playing(){
    super.playing();
    print("Childrens are playing with (CHILD CLASS)");
  }

}

void main(){

    Child child = Child();
    child.playing();

}