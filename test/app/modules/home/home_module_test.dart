import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/app_module.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/usecases/remote_anime_usecase.dart';
import 'package:desafio_bloc/app/modules/home/home_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/api_result.dart';

class DioMock extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  final _requestOptions = RequestOptionsMock();
  final _dio = DioMock();
  initModules([AppModule(), HomeModule()],
      replaceBinds: [modular.Bind<Dio>((i) => _dio)]);

  /*
  group("DI tests", () {
    final int _pageMock = 1;
    final int _offsetMock = 10;
    test("Deve recuperar o usecase sem erro.", () {
      final usecase = modular.Modular.get<IRemoteAnimeUsecase>();
      expect(usecase, isA<RemoteAnimeUsecase>());
    });

    test("deve retornar uma List<ResultSearchModel>", () async {
      when(() => _dio.get(any())).thenAnswer((_) async => Response<List>(
          requestOptions: _requestOptions,
          data: jsonDecode(apiResult),
          statusCode: 200));
      final usecase = modular.Modular.get<RemoteAnimeUsecase>();
      final result = await usecase(_pageMock, _offsetMock);
      expect(result, isA<Right<SearchFailure, List<AnimeEntity>>>());
    });
  });
  */
}
