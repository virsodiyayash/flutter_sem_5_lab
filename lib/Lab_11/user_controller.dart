import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_advance_lab/Lab_11/user_api_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

enum ApiState{idle , loading , success , error}

class UserController extends GetxController{
  UserApi _userApi = UserApi();
  RxList<UserApi> usersList = <UserApi>[].obs;
  RxList<UserApi> filteredUser = <UserApi>[].obs;

  final apiState = ApiState.idle.obs;

  TextEditingController nameController = TextEditingController();

  // get apiUsers => usersList;
  
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await fetchUsers();
    await filterUser("");
    print(usersList);
  }
  
   Future<void> fetchUsers() async{
    try{

      apiState.value = ApiState.loading;

      final response = await http.get(Uri.parse("https://67b41a0f392f4aa94fa95115.mockapi.io/apicrud"));
      
      if(response.statusCode == 200){
        final data = List.from(jsonDecode(response.body)).map((e) => UserApi.fromMap(e)).toList();
        print(data);
        usersList.value = data;

        apiState.value = ApiState.success;
      }
      else{
        apiState.value = ApiState.error;
      }
    }
    catch(e){
      print("Error is $e");
      apiState.value = ApiState.error;
    }
  }

  Future<void> filterUser(String query) async{
      if(query.isEmpty){
        filteredUser.value = usersList;
      }
      else{
        filteredUser.value = usersList.where((user) => user?.name?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
      }
  }
}