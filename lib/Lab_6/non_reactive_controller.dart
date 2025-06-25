import 'package:get/get.dart';

class NonReactiveController extends GetxController{

  int x = 0;

  void increment(){
    x = x + 1;
    print(x);
  }

}