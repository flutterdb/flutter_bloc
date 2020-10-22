import 'package:flutter_demo_bloc/models/single_user_data.dart';

class UserDetailsState{}

class UserDetailsInitialState extends UserDetailsState{}

class UserDetailsLoadingState extends UserDetailsState{}

class UserDetailsLoadedState extends UserDetailsState{
  SingleUserData singleUserData;
  UserDetailsLoadedState(this.singleUserData);
}

class UserDetailsErrorState extends UserDetailsState{
  Error error;
  UserDetailsErrorState(this.error);
}