import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/repositories/anime_repositories.dart';
import 'package:desafio_bloc/app/modules/home/domain/usecases/remote_anime_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RemoteAnimeRepositoryMock extends Mock implements IRemoteAnimeRepository {
}

main() {
  final _repository = RemoteAnimeRepositoryMock();
  final _usecase = RemoteAnimeUsecase(_repository);
  /*
  group("RemoteAnimeUsecase tests", () {
    final _AnimeEntityMock =
        AnimeEntity(animeId: 00, link: "link", title: "title");
    final List<AnimeEntity> list = [];

    test(
      "Deve retornar uma Lista de AnimeEntity",
      () async {
        final int _pageMock = 1;
        final int _offsetMock = 10;
        when(() => _repository.search(any(), any())).thenAnswer(
            (_) async => Right<SearchFailure, List<AnimeEntity>>(list));
        final result = await _usecase(_pageMock, _offsetMock);
        expect(result, Right<SearchFailure, List<AnimeEntity>>(list));
        verify(() => _repository.search(any(), any())).called(1);
      },
    );

    test("Deve retornar um AnimeError caso os parâmetros sejam inválidos.",
        () async {
      final int _pageMock = 0;
      final int _offsetMock = 10;
      when(() => _repository.search(any(), any())).thenAnswer((_) async =>
          Right<SearchFailure, List<AnimeEntity>>([_AnimeEntityMock]));
      final result = await _usecase(_pageMock, _offsetMock);
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<AnimeError>()); //ou id, id
      verifyNever(() => _repository.search(any(), any()));
    });
  });
  */
}
