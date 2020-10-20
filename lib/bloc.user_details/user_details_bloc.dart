
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc.user_details/user_details_event.dart';
import 'package:flutter_demo_bloc/bloc.user_details/user_details_state.dart';
import 'package:flutter_demo_bloc/data/repos/user_repo.dart';
import 'package:flutter_demo_bloc/models/user_list_resp.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState>{

  UserRepository userRepository = UserRepository();
  UserDetailsBloc() : super(UserDetailsInitialState());

  @override
  Stream<UserDetailsState> mapEventToState(UserDetailsEvent event) async*{
    if (event is FetchUserDetailsEvent){
      yield UserDetailsLoadingState();
      try {
        UserListResponse userResponseList = await userRepository.getUserList();
        yield UserDetailsLoadedState(userResponseList);
        print(userResponseList);
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserDetailsErrorState(e);
      }
    }
  }

}