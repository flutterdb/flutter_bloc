// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListResponse _$UserListResponseFromJson(Map<String, dynamic> json) {
  return UserListResponse(
    page: json['page'] as int,
    perPage: json['per_page'] as int,
    total: json['total'] as int,
    totalPages: json['total_pages'] as int,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : UserData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ad: json['ad'] == null
        ? null
        : Ad.fromJson(json['ad'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserListResponseToJson(UserListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
      'ad': instance.ad,
    };
