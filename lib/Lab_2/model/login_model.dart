class LogInModel{

  String? validateName(String value){
    if(value.isEmpty || value == null){
      return "Please Enter your name";
    }

    return null;
  }

  String? validateEmail(String value){
    if(value.isEmpty || value == null){
      return "Please Enter your email";
    }

    return null;
  }

  String? validateNumber(String value){
    if(value.isEmpty || value == null){
      return "Please enter your number";
    }

    return null;
  }

  String? validatePassword(String value){
    if(value.isEmpty || value == null){
      return "Please Enter your password";
    }

    return null;
  }

  String? validateConfirmPassword(String password , String confirmPassword){
    if(confirmPassword.isEmpty){
      return "Please Confirm your password";
    }

    if(password != confirmPassword){
      return "Password does not match";
    }

    return null;
  }

}