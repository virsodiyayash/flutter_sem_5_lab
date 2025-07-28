class CustomException implements Exception{
  String cause;
  CustomException(this.cause);
}

void main(){
  try{
    throw CustomException("This is caused by custom exception").cause;
  }catch(e){
    print("There is an error occured : ${e.toString()}");
  }
}
