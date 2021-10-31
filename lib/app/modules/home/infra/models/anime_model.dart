import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';

class AnimeModel extends AnimeEntity with EquatableMixin {
  final int animeId;
  final String link;
  final String title;

  AnimeModel({
    required this.animeId,
    required this.link,
    required this.title,
  }) : super(animeId: animeId, link: link, title: title);

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    //todo nomenclatura para fromMap
    return AnimeModel(
      animeId: map['id'],
      link: map['link'],
      title: (map['title'] as Map<String, dynamic>)['rendered'],
    );
  }

  factory AnimeModel.fromMapString(Map<String, dynamic> map) {
    return AnimeModel(
      animeId: map['animeId'],
      link: map['link'],
      title: map['title'],
    );
  }

  @override
  List<Object?> get props => [animeId, link, title];

  Map<String, dynamic> toMap() {
    return {
      'animeId': animeId,
      'link': link,
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());

  factory AnimeModel.fromJson(String source) =>
      AnimeModel.fromMapString(json.decode(source));
}
