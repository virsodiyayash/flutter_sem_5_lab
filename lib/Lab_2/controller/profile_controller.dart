import 'package:flutter_advance_lab/Lab_2/model/profile_model.dart';

class ProfileController{

  final ProfileModel _model = ProfileModel();

  String? validateName(String? value) => _model.validateName(value);
  String? validateEmail(String? value) => _model.validateEmail(value);
  String? validateNumber(String? value) => _model.validateNumber(value);


}