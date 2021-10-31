import 'package:desafio_bloc/app/core/data_transfer_object.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class FetchRemoteList extends PostEvent {
  final AnimeDTO anime;
  FetchRemoteList({
    required this.anime,
  });

  @override
  List<Object?> get props => [];
}

class UpdateLocalList extends PostEvent {
  final int page;
  final int offset;
  final List<AnimeEntity> newList;
  UpdateLocalList(
      {required this.page, required this.offset, required this.newList});

  @override
  List<Object?> get props => [];
}

class FetchLocalList extends PostEvent {
  @override
  List<Object?> get props => [];
}

class LocalListLoaded extends PostEvent {
  final List<AnimeEntity>? localListLoaded;
  LocalListLoaded({this.localListLoaded});
  @override
  List<Object?> get props => [];
}
