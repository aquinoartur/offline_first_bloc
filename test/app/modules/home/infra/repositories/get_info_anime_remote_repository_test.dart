import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/infra/datasources/anime_datasources.dart';
import 'package:desafio_bloc/app/modules/home/infra/models/anime_model.dart';
import 'package:desafio_bloc/app/modules/home/infra/repositories/remote_anime_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RemoteAnimeDatasourceMock extends Mock implements IRemoteAnimeDatasource {
}

main() {
  final IRemoteAnimeDatasource _datasource = RemoteAnimeDatasourceMock();
  final RemoteAnimeRepository _repository = RemoteAnimeRepository(_datasource);
  /*
  group("RemoteAnimeRepository tests", () {
    final List<AnimeModel> list = [];
    final int _pageMock = 1;
    final int _offsetMock = 10;

    test("Deve retornar uma Lista de AnimeEntity", () async {
      when(() => _datasource.get(any(), any())).thenAnswer((_) async => list);
      final result = await _repository.search(_pageMock, _offsetMock);
      expect(result, Right<SearchFailure, List<AnimeEntity>>(list));
      verify(() => _datasource.get(any(), any())).called(1);
    });

    test(
        "Deve retornar um erro do tipo DatasourceException se o datasource retornar erro do tipo DatasourceExcepction.",
        () async {
      when(() => _datasource.get(any(), any()))
          .thenThrow(DatasourceException());
      final result = await _repository.search(_pageMock, _offsetMock);
      expect(result, Left(DatasourceException()));
      verify(() => _datasource.get(any(), any())).called(1);
    });

    test(
        "Deve retornar um erro do tipo DatasourceError se o datasource retornar uma Exception qualquer.",
        () async {
      when(() => _datasource.get(any(), any())).thenThrow(Exception());
      final result = await _repository.search(_pageMock, _offsetMock);
      expect(result, Left(DatasourceError(message: "")));
      verify(() => _datasource.get(any(), any())).called(1);
    });
  });
  */
}
