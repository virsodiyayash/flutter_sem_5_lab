class ProfileModel{

  String? validateName(String? value){
    if(value == null || value.isEmpty){
      return "Enter valid name";
    }
    return null;
  }

  String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return "Enter valid Email";
    }
    return null;
  }

  String? validateNumber(String? value){
    if(value == null || value.isEmpty){
      return "Enter valid Number";
    }
    return null;
  }

}