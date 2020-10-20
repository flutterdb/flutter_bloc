import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/data/repos/user_repo.dart';
import 'package:flutter_demo_bloc/models/user_data.dart';
import 'package:flutter_demo_bloc/models/user_list_resp.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  UserRepository userRepository = UserRepository();
  List<UserData> userList = [];
  Future userListFuture;

  initState(){
    userListFuture = fetchData();
    super.initState();
  }

  Future<List<UserData>> fetchData() async {
    UserListResponse userListResponseModel = await userRepository.getUserList();
    userList.clear();
    userList.addAll(userListResponseModel.data);
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FutureBuilder(
                  future: userListFuture,
                  builder: (BuildContext ctx, AsyncSnapshot snapShot){
                    if(snapShot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    return ListView.separated(
                      separatorBuilder: (BuildContext ctx, int index){
                        return Divider(
                          color: Colors.grey,
                        );
                      },
                      padding: EdgeInsets.all(8.0),
                      shrinkWrap: true,
                      itemCount: snapShot.data.length,
                      itemBuilder: (BuildContext ctx, int index){
                        return Row(
                          children: [
                            CircleAvatar(
                                child: Image.network(snapShot.data[index].avatar,)
                            ),
                            Column(
                              children: [
                                Text(snapShot.data[index].firstName),
                                Text(snapShot.data[index].email),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
