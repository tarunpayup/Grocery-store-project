import 'dart:convert';

import '../models/user_model.dart';
import '../services/api_service.dart';

class UserRepository{
  final ApiService apiService = ApiService();
  Future<List<UserModel>> getUsers() async{
    final data = await apiService.fetchUsers(); //Whole json will store into data

    return data.map<UserModel>(
      (json) => UserModel.fromJSON(json),
    ).toList();
  }
}