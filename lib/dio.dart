import 'package:dio/dio.dart';

Dio get dio {
  const baseUrl = 'https://qiita.com/api/v2';
  const accessToken = String.fromEnvironment('ACCESS_TOKEN');
  final headers = {'Authorization': 'Bearer $accessToken'};
  final options = BaseOptions(baseUrl: baseUrl, headers: headers);
  return Dio(options);
}
