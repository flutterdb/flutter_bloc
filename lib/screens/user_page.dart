
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_list_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_list_state.dart';
import 'package:flutter_demo_bloc/screens/user_details_screen.dart';
import 'package:flutter_demo_bloc/utils/constants.dart';

import '../main.dart';

class UserPage extends StatefulWidget{
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  UserListLoadedState userDetailsLoadedState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_TITLE),
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {

            if (state is UserListLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserListLoadedState) {
              userDetailsLoadedState = state;

              return ListView.builder(
                  itemCount: state.userListResponse.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        navigateToNextPage(context, state.userListResponse.data[index].id);
                      },
                      child: Padding(
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
                      ),
                    );
                  });
            }

            if (state is UserListErrorState) {
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

  void navigateToNextPage(BuildContext context, int id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx) => UserDetailsScreen(userId: id,)));
  }
}