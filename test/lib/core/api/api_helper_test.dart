import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_mpos/core/api/api_exception.dart';
import 'package:movie_mpos/core/api/api_helper.dart';

import 'api_helper_test.mocks.dart';

void main() {
  group('ApiHelper', () {
    late ApiHelper apiHelper;
    late MockDio dio;

    setUp(() {
      dio = MockDio();
      apiHelper = ApiHelper(dio);
    });

    test('request GET', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'OK'},
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      final result = await apiHelper.request(method: Method.get, url: url);

      expect(result, {'message': 'OK'});
      verify(dio.get(url)).called(1);
    });

    test('request POST', () async {
      const url = 'https://example.com/api/data';
      final data = {'key': 'value'};
      final response = Response(
        data: {'message': 'OK'},
        statusCode: 201,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.post(url, data: null)).thenAnswer((_) async => response);

      final result =
          await apiHelper.request(method: Method.post, url: url, data: data);

      expect(result, {'message': 'OK'});
      verify(dio.post(url, data: null)).called(1);
      verifyNever(dio.post(url, data: anyNamed('data')));
    });

    test('request PUT', () async {
      const url = 'https://example.com/api/data';
      final data = {'key': 'value'};
      final response = Response(
        data: {'message': 'OK'},
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.put(url, data: null)).thenAnswer((_) async => response);

      final result =
          await apiHelper.request(method: Method.put, url: url, data: data);

      expect(result, {'message': 'OK'});
      verify(dio.put(url, data: null)).called(1);
      verifyNever(dio.post(url, data: anyNamed('data')));
    });

    test('request PATCH', () async {
      const url = 'https://example.com/api/data';
      final data = {'key': 'value'};
      final response = Response(
        data: {'message': 'OK'},
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.patch(url, data: null)).thenAnswer((_) async => response);

      final result =
          await apiHelper.request(method: Method.patch, url: url, data: data);

      expect(result, {'message': 'OK'});
      verify(dio.patch(url, data: null)).called(1);
      verifyNever(dio.post(url, data: anyNamed('data')));
    });

    test('request DELETE', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'OK'},
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.delete(url)).thenAnswer((_) async => response);

      final result = await apiHelper.request(method: Method.delete, url: url);

      expect(result, {'message': 'OK'});
      verify(dio.delete(url)).called(1);
    });

    test('request con error de conexión', () async {
      const url = 'https://example.com/api/data';
      when(dio.get(url))
          .thenThrow(const SocketException('No Internet connection'));

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<FetchDataException>()));
    });

    test('request con error de servidor', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 500,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<InternalServerException>()));
    });

    test('request con error 400', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 400,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<BadRequestException>()));
    });

    test('request con error 401', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 401,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<UnauthorizedException>()));
    });

    test('request con error 403', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 403,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<ForbiddenException>()));
    });

    test('request con error 404', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 404,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<NotFoundException>()));
    });

    test('request con error 422', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 422,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<UnprocessableContentException>()));
    });

    test('request con error 500', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 500,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<InternalServerException>()));
    });

    test('request con error desconocido', () async {
      const url = 'https://example.com/api/data';
      final response = Response(
        data: {'message': 'Error'},
        statusCode: 999,
        requestOptions: RequestOptions(path: url),
      );
      when(dio.get(url)).thenAnswer((_) async => response);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<FetchDataException>()));
    });

    test('request con DioException', () async {
      const url = 'https://example.com/api/data';
      final dioException = DioException(
        response: Response(
          data: {'message': 'Error'},
          statusCode: 400,
          requestOptions: RequestOptions(path: url),
        ),
        requestOptions: RequestOptions(path: url),
      );

      when(dio.get(url)).thenThrow(dioException);

      expect(() async => await apiHelper.request(method: Method.get, url: url),
          throwsA(isA<BadRequestException>()));
    });
  });
}
