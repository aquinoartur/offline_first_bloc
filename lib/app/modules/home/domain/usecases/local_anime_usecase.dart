import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/repositories/anime_repositories.dart';

abstract class ILocalAnimeUsecase {
  Future<Either<SearchFailure, List<AnimeEntity>>> call(
      int page, int offset, List<AnimeEntity> list);
}

class LocalAnimeUsecase implements ILocalAnimeUsecase {
  final ILocalAnimeRepository repository;
  LocalAnimeUsecase(this.repository);
  @override
  Future<Either<SearchFailure, List<AnimeEntity>>> call(
      int page, int offset, List<AnimeEntity> list) async {
    if (page <= 0 || page > 100) {
      return Left(AnimeError(
          message: "O índice fornecido deve estar entre a faixa de 1 e 100!"));
    }
    final result = await repository.search(page, offset, list);
    return result;
  }
}
