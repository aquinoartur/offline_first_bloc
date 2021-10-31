import 'package:desafio_bloc/app/core/data_transfer_object.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/infra/models/anime_model.dart';

abstract class IRemoteAnimeDatasource {
  Future<List<AnimeModel>> get(AnimeDTO anime);
}

abstract class ILocalAnimeDatasource {
  Future<List<AnimeModel>> get(int page, int offset, List<AnimeEntity> list);
}
