import 'package:desafio_bloc/app/core/data_transfer_object.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IRemoteAnimeRepository {
  Future<Either<SearchFailure, List<AnimeEntity>>> search(AnimeDTO anime);
}

abstract class ILocalAnimeRepository {
  Future<Either<SearchFailure, List<AnimeEntity>>> search(
      int page, int offset, List<AnimeEntity> list);
}
