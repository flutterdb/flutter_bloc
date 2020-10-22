
import 'package:flutter_demo_bloc/models/user_list_resp.dart';

class UserListState{}

class UserListInitialState extends UserListState{}

class UserListLoadingState extends UserListState{}

class UserListLoadedState extends UserListState{
  UserListResponse userListResponse;
  UserListLoadedState(this.userListResponse);
}

class UserListErrorState extends UserListState{
  Error error;
  UserListErrorState(this.error);
}