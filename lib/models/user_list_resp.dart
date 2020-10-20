import 'package:flutter_demo_bloc/models/user_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'ad.dart';

part 'user_list_resp.g.dart';

@JsonSerializable()
class UserListResponse {
  int page;
  @JsonKey(name : "per_page")
  int perPage;
  int total;
  @JsonKey(name: "total_pages")
  int totalPages;
  List<UserData> data;
  Ad ad;

  UserListResponse(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.ad});

  factory UserListResponse.fromJson(Map<String, dynamic> json) => _$UserListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserListResponseToJson(this);
}