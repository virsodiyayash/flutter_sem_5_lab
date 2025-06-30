import 'package:get/get.dart';



class ListController extends GetxController{

  RxList<dynamic> usersList = ["hello" , "hiii" , "Kem chhho"].obs;

  void add(dynamic value){
    usersList.add(value);
  }

  void deleteUser(int index){
    usersList.removeAt(index);
  }

}