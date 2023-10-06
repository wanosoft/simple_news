import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return RemoteConfig.buildDioClient();
}

class RemoteConfig {
  const RemoteConfig._();

  static const baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const authorizationHeaders = {
    'Authorization': String.fromEnvironment('API_KEY')
  };

  static Dio buildDioClient() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl,
        headers: authorizationHeaders,
      );
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }
}
