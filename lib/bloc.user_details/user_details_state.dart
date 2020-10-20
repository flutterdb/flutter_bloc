
import 'package:flutter_demo_bloc/models/user_list_resp.dart';

class UserDetailsState{}

class UserDetailsInitialState extends UserDetailsState{}

class UserDetailsLoadingState extends UserDetailsState{}

class UserDetailsLoadedState extends UserDetailsState{
  UserListResponse userListResponse;
  UserDetailsLoadedState(this.userListResponse);
}

class UserDetailsErrorState extends UserDetailsState{
  Error error;
  UserDetailsErrorState(this.error);
}