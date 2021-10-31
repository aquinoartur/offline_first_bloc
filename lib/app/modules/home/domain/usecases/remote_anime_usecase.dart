import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/core/data_transfer_object.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/repositories/anime_repositories.dart';

abstract class IRemoteAnimeUsecase {
  Future<Either<SearchFailure, List<AnimeEntity>>> call(AnimeDTO anime);
}

class RemoteAnimeUsecase implements IRemoteAnimeUsecase {
  final IRemoteAnimeRepository repository;
  RemoteAnimeUsecase(this.repository);
  @override
  Future<Either<SearchFailure, List<AnimeEntity>>> call(AnimeDTO anime) async {
    if (anime.page <= 0 || anime.page > 100) {
      return Left(AnimeError(
          message: "O índice fornecido deve estar entre a faixa de 1 e 100!"));
    }
    final result = await repository.search(anime);
    return result;
  }
}

//todo criar params