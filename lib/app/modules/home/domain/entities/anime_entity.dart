import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final int animeId;
  final String link;
  final String title;

  AnimeEntity({
    required this.animeId,
    required this.link,
    required this.title,
  });

  @override
  List<Object?> get props => [animeId, link, title];
}
