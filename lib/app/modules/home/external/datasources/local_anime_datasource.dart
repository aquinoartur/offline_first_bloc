import 'dart:convert';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/infra/datasources/anime_datasources.dart';
import 'package:desafio_bloc/app/modules/home/infra/models/anime_model.dart';
import 'package:sqflite/sqflite.dart';
import 'helper/local_database_helper.dart';

class LocalAnimeDatasource implements ILocalAnimeDatasource {
  var databaseFuture = LocalDatabaseHelper.db.database; //singleton database
  static const ANIME_TABLE_NAME = 'anime';

  @override
  Future<List<AnimeModel>> get(
      int page, int offset, List<AnimeEntity> list) async {
    List<AnimeModel> animeList;
    if (list.isNotEmpty) {
      List<AnimeModel> animeListUpdate = listConvert(list);
      updateDatabase(animeListUpdate);
    }
    final Database database = await databaseFuture;
    var animeMap = await database.query(ANIME_TABLE_NAME);
    animeList = animeMap.map((item) => AnimeModel.fromMapString(item)).toList();
    print("---------------------------------------------");
    print("novos itens: ${list.length}");
    print("itens do banco local: ${animeList.length}");
    print("---------------------------------------------");
    return animeList;
  }

  List<AnimeModel> listConvert(List<AnimeEntity> list) {
    var listToString = jsonEncode(list);
    var stringToList = jsonDecode(listToString);
    final List<AnimeModel> animeList = (stringToList as List).map((e) {
      return AnimeModel.fromJson(e);
    }).toList();
    return animeList;
  }

  Future<void> updateDatabase(List<AnimeModel> animeList) async {
    final Database database = await databaseFuture;
    Batch batch = database.batch();
    animeList.forEach((anime) async {
      batch.insert(
        ANIME_TABLE_NAME,
        anime.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    batch.commit();
  }
}
