
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_details_event.dart';
import 'package:flutter_demo_bloc/bloc/user_details_state.dart';
import 'package:flutter_demo_bloc/data/repos/user_repo.dart';
import 'package:flutter_demo_bloc/models/single_user_data.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState>{

  UserRepository userRepository = UserRepository();
  UserDetailsBloc() : super(UserDetailsInitialState());

  @override
  Stream<UserDetailsState> mapEventToState(UserDetailsEvent event) async* {
    if (event is FetchUserDetailsEvent){
      yield UserDetailsLoadingState();
      try {
        SingleUserData singleUserData = await userRepository.getUserDetails(event.userId);
        yield UserDetailsLoadedState(singleUserData);
        print(singleUserData);
      } catch (e) {
        print("error msg ${e.toString()}");
        yield UserDetailsErrorState(e);
      }
    }
  }

}