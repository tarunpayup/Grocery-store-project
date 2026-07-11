import '../models/user_model.dart';
import '../repositories/user_repository.dart';
import 'package:flutter/material.dart';


class UserViewModel extends ChangeNotifier{
  final UserRepository _repository = UserRepository();

  List<UserModel> _users = [];
  bool _isLoading = false;
  String _errorMessage = "";

  //Getters
  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchUsers() async{
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();

    try{
      _users = await _repository.getUsers();
    }catch(e){
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

}