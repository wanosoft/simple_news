import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:simple_news/core/config/remote_config.dart';

void main() {
  group('remote config', () {
    test('should build dio client', () {
      final dio = RemoteConfig.buildDioClient();

      expect(dio.options.baseUrl, RemoteConfig.baseUrl);
      expect(dio.options.headers, RemoteConfig.authorizationHeaders);
      expect(
        dio.interceptors,
        isA<List<Interceptor>>().having(
          (p0) => p0[1],
          'PrettyDioLogger',
          isA<PrettyDioLogger>(),
        ),
      );
    });
  });
}
