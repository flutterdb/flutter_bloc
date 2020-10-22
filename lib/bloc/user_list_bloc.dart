
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_list_event.dart';
import 'package:flutter_demo_bloc/bloc/user_list_state.dart';
import 'package:flutter_demo_bloc/data/repos/user_repo.dart';
import 'package:flutter_demo_bloc/models/user_list_resp.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState>{

  UserRepository userRepository = UserRepository();
  UserListBloc() : super(UserListInitialState());

  @override
  Stream<UserListState> mapEventToState(UserListEvent event) async*{
    if (event is FetchUserListEvent){
      yield UserListLoadingState();
      try {
        UserListResponse userResponseList = await userRepository.getUserList();
        yield UserListLoadedState(userResponseList);
        print(userResponseList);
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserListErrorState(e);
      }
    }
  }

}