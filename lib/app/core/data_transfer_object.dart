import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';

class AnimeDTO {
  int page = 1;
  int offset = 10;
  List<AnimeEntity>? list;
}
