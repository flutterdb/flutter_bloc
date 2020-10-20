
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc.user_details/user_details_bloc.dart';
import 'package:flutter_demo_bloc/bloc.user_details/user_details_event.dart';
import 'package:flutter_demo_bloc/bloc.user_details/user_details_state.dart';
import 'package:flutter_demo_bloc/utils/constants.dart';

import '../main.dart';

class UserPage extends StatefulWidget{
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  UserDetailsLoadedState userDetailsLoadedState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(USER_DETAILS),
        ),
        body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
          builder: (context, state) {

            if (state is UserDetailsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserDetailsLoadedState) {
              userDetailsLoadedState = state;

              return ListView.builder(
                  itemCount: state.userListResponse.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.grey)], color: Colors.white70),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(state.userListResponse.data[index].avatar),
                                ),
                                SizedBox(width: 12.0,),
                                Container(alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            LBL_USER_ID,
                                            style: Theme.of(context).textTheme.bodyText2,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(state.userListResponse.data[index].id
                                              .toString()),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            LBL_USER_FIRST_NAME,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(state.userListResponse.data[index].firstName),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            LBL_USER_LAST_NAME,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(state.userListResponse.data[index].lastName),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            LBL_USER_EMAIL,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(state.userListResponse.data[index].email),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }

            if (state is UserDetailsErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }

            return Container(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.bloc<ThemeCubit>().toggleTheme(),
          child: const Icon(Icons.brightness_6),
        ),
    );
  }
}