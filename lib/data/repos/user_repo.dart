import 'package:dio/dio.dart';
import 'package:flutter_demo_bloc/data/api_client.dart';

class UserRepository{

  static final UserRepository _singletonUserRepository = UserRepository._internal();

  factory UserRepository() {
    return _singletonUserRepository;
  }

  UserRepository._internal();

  Future<dynamic> getUserList() async{
    return await ApiClient(Dio()).fetchUserList();
  }

  Future<dynamic> getUserDetails(int id) async {
    return await ApiClient(Dio()).fetchUserDetails(id);
  }
}