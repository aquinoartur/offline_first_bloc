import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/external/datasources/remote_anime_datasource.dart';
import 'package:desafio_bloc/app/modules/home/infra/models/anime_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  final Dio _dio = DioMock();
  final _requestOptions = RequestOptionsMock();
  final _datasource = RemoteAnimeDatasource(_dio);

  /*
  group("GetAnimeDataSource tests", () {
    final int _pageMock = 1;
    final int _offsetMock = 10;

    test("Deve retornar uma Lista de AnimeModel", () async {
      when(() => _dio.get(any())).thenAnswer((_) async => Response<List>(
          requestOptions: _requestOptions,
          data: [],
          statusCode: 200)); //tratar resultado da api com RegExp
      final future = await _datasource.get(_pageMock, _offsetMock);
      expect(future, isA<List<AnimeModel>>());
      verify(() => _dio.get(any())).called(1);
    });

    test("Deve retornar um DataSourceError se o statuscode não for 200.",
        () async {
      when(() => _dio.get(any())).thenAnswer((_) async => Response<List>(
          requestOptions: _requestOptions,
          data: [],
          statusCode: 401)); //tratar resultado da api com RegExp
      final future = _datasource.get(_pageMock, _offsetMock);
      expect(future, throwsA(isA<DatasourceError>()));
      verify(() => _dio.get(any())).called(1);
    });
  });
  */
}
