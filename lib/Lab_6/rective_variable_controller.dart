import 'package:get/get.dart';

class RectiveVariableController extends GetxController{

  RxInt x = 0.obs;

  void increment(){
    x = x + 1;
    print(x);
  }

}