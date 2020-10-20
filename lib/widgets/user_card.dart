
import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/models/user_data.dart';

class UserCard extends StatelessWidget{

  final UserData userData;

  const UserCard({Key key, this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8.0,
          backgroundImage: NetworkImage(userData.avatar),
        ),
        Column(
          children: [
            Text(userData.firstName + " " + userData.lastName),
            Text(userData.email),
          ],
        )
      ],
    );
  }

}