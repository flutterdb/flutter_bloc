// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://reqres.in/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UserListResponse> fetchUserList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    try{
      final _result = await _dio.request<Map<String, dynamic>>('api/users?page=2',
          queryParameters: queryParameters,
          options: RequestOptions(
              method: 'GET',
              headers: <String, dynamic>{},
              extra: _extra,
              baseUrl: baseUrl),
          data: _data);
      final value = UserListResponse.fromJson(_result.data);
      return value;
    }
    on DioError catch(dioError){
      throw ServerError.withError(error: dioError);
    }
  }
}
