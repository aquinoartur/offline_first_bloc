import 'package:desafio_bloc/app/core/data_transfer_object.dart';
import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:dio/dio.dart';
import 'package:desafio_bloc/app/modules/home/infra/datasources/anime_datasources.dart';
import 'package:desafio_bloc/app/modules/home/infra/models/anime_model.dart';

class RemoteAnimeDatasource implements IRemoteAnimeDatasource {
  final Dio dio;
  RemoteAnimeDatasource(
    this.dio,
  );
  @override
  Future<List<AnimeModel>> get(AnimeDTO anime) async {
    final String path =
        "https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=${anime.page}&per_page=${anime.offset}";
    final response = await dio.get(path);
    if (response.statusCode == 200) {
      final list = (response.data! as List).map((e) {
        return AnimeModel.fromMap(e);
      }).toList();
      return list;
    } else {
      throw DatasourceError(message: "Falha ao acessar o servidor.");
    } //todo incluir os outros erros
  }
}
