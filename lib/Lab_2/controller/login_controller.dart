import 'package:flutter_advance_lab/Lab_2/model/login_model.dart';

class LogInController {
  final LogInModel _model = LogInModel();

  String? validateName(String value) => _model.validateName(value);
  String? validateEmail(String value) => _model.validateEmail(value);
  String? validateNumber(String value) => _model.validateNumber(value);
  String? validatePassword(String value) => _model.validatePassword(value);
  String? validateConfirmPassword(String password , String confirmPassword) => _model.validateConfirmPassword(password, confirmPassword);

}
  