import 'dart:io';

void main(){

  try{
    int a = int.parse(stdin.readLineSync()!);

    int b = int.parse(stdin.readLineSync()!);

    Future.delayed(Duration(seconds: 3));

    if(b == 0){
      throw IntegerDivisionByZeroException();
    }
    int c = a ~/ b;
    print("The division is : $c");
  }
  on IntegerDivisionByZeroException{
    print("You can't divide by zero");
  }
  on FormatException{
    print("Invalid type of input");
  }
  catch(e){
    print("The error is : $e");

  }

}