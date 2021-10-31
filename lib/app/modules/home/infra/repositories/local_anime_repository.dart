import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/repositories/anime_repositories.dart';
import 'package:desafio_bloc/app/modules/home/infra/datasources/anime_datasources.dart';

class LocalAnimeRepository implements ILocalAnimeRepository {
  final ILocalAnimeDatasource datasource;
  LocalAnimeRepository(
    this.datasource,
  );
  @override
  Future<Either<SearchFailure, List<AnimeEntity>>> search(
      int page, int offset, List<AnimeEntity> list) async {
    try {
      final result = await datasource.get(page, offset, list);
      return Right(result);
    } on DatasourceException catch (e) {
      return Left(e);
    }
  }
}
