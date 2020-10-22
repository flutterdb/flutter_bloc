
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_details_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_details_event.dart';
import 'package:flutter_demo_bloc/bloc/user_details_state.dart';
import 'package:flutter_demo_bloc/utils/constants.dart';

class UserDetailsScreen extends StatefulWidget{

  final userId;

  const UserDetailsScreen({Key key, this.userId}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(USER_DETAILS),
      ),
      body: BlocBuilder(
        cubit: UserDetailsBloc()..add(FetchUserDetailsEvent(widget.userId)),
        builder: (context, state){

          if(state is UserDetailsLoadingState){
            return Center(child: CircularProgressIndicator());
          }

          if(state is UserDetailsLoadedState){
            return Center(
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(state.singleUserData.data.avatar),
                        radius: 80.0,
                      ),
                      SizedBox(height: 16.0,),
                      Text(LBL_USER_ID + state.singleUserData.data.id.toString(), style: TextStyle(fontSize: 22.0, color: Colors.black87, fontWeight: FontWeight.w600),),
                      SizedBox(height: 8.0,),
                      Text(LBL_USER_FULL_NAME  + state.singleUserData.data.firstName + state.singleUserData.data.lastName, style: TextStyle(fontSize: 22.0, color: Colors.black87, fontWeight: FontWeight.w600),),
                      SizedBox(height: 8.0,),
                      Text(LBL_USER_EMAIL + state.singleUserData.data.email, style: TextStyle(fontSize: 22.0, color: Colors.black87, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
            );
          }

          if(state is UserDetailsErrorState){
            return Text(state.error.toString());
          }

          return Container();
        },
      ),
    );
  }

}