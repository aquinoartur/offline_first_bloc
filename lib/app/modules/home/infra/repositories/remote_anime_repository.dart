import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/core/data_transfer_object.dart';

import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/repositories/anime_repositories.dart';
import 'package:desafio_bloc/app/modules/home/infra/datasources/anime_datasources.dart';

class RemoteAnimeRepository implements IRemoteAnimeRepository {
  final IRemoteAnimeDatasource datasource;
  RemoteAnimeRepository(
    this.datasource,
  );
  @override
  Future<Either<SearchFailure, List<AnimeEntity>>> search(
      AnimeDTO anime) async {
    try {
      final result = await datasource.get(anime);
      return Right(result);
    } on DatasourceException catch (e) {
      return Left(e);
    }
  }
}
