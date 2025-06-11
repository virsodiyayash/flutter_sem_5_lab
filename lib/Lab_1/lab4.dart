abstract class Student{
  void playing();

  void drawing(){
    print("Students are drawing a picture");
  }
}

class Children extends Student{
  void playing(){
    print("Children and Students are playing");
  }
}

void main(){
  Children child = Children();
  child.drawing();
  child.playing();
}