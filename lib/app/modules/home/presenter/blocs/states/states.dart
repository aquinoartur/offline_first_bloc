import 'package:desafio_bloc/app/core/errors/errors.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';

abstract class SearchState {}

class SearchSuccess implements SearchState {
  final List<AnimeEntity> updatedList;
  final List<AnimeEntity> remoteNewList;
  SearchSuccess({required this.updatedList, required this.remoteNewList});
}

class SearchLoading implements SearchState {}

class SearchError implements SearchState {
  final SearchFailure error;
  SearchError(this.error);
}

class LocalSearch extends SearchState {}

class ConnectivityNone extends SearchState {}

class SearchUpdate extends SearchState {
  final List<AnimeEntity> list;
  SearchUpdate({required this.list});
}

//************************************************

class LocalSearchSuccess extends SearchState {
  final List<AnimeEntity> localListLoaded;

  LocalSearchSuccess({required this.localListLoaded});
}

class LocalSearchLoading extends SearchState {}

class LocalSearchError extends SearchState {
  final SearchFailure error;
  LocalSearchError(this.error);
}
