import 'dart:io';

void main(){

  try{
    print("Enter anything you want : ");
    int a = int.parse(stdin.readLineSync()!);

    print("Enter anything you want");
    int b = int.parse(stdin.readLineSync()!);

    print(a / b);
  } on FormatException{
    print("Please enter valid format of the data");
  } on SocketException{
    print("Please connect your phone with internet");
  } catch(e){
    print("There is an error : $e");
  }

}