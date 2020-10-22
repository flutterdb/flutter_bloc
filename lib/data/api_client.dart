import 'package:dio/dio.dart';
import 'package:flutter_demo_bloc/data/server_error.dart';
import 'package:flutter_demo_bloc/models/single_user_data.dart';
import 'package:flutter_demo_bloc/models/user_list_resp.dart';
import 'package:flutter_demo_bloc/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiClient{
    factory ApiClient (Dio dio){
        return _ApiClient(dio);
    }

    @GET("api/users?page=2")
    Future<UserListResponse> fetchUserList();

    @GET("api/users/{userId}")
    Future<SingleUserData> fetchUserDetails(@Path("userId") int id);
}