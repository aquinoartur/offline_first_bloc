import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:desafio_bloc/app/core/data_transfer_object.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/events/events.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desafio_bloc/app/modules/home/domain/usecases/remote_anime_usecase.dart';

//Cada bloco tem um fluxo de estado que outros blocos podem assinar para reagir às mudanças dentro do bloco.
class PostBloc extends Bloc<PostEvent, SearchState> {
  final IRemoteAnimeUsecase usecase;
  final Connectivity connectivity;
  final AnimeDTO animeDTO;
  late final StreamSubscription connectivityStreamSubscription;

  PostBloc({
    required this.usecase,
    required this.connectivity,
    required this.animeDTO,
  }) : super(LocalSearch()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi)
          add(FetchRemoteList(anime: animeDTO));
        if (connectivityResult != ConnectivityResult.wifi)
          add(FetchLocalList());
      },
    );
  }

  List<AnimeEntity> updatedList = [];

  @override
  Stream<SearchState> mapEventToState(PostEvent event) async* {
    if (event is FetchRemoteList) {
      yield SearchLoading();
      final result = await usecase(animeDTO);
      yield result.fold(
        (l) => SearchError(l),
        (r) {
          updatedList += r;
          return SearchSuccess(updatedList: updatedList, remoteNewList: r);
        },
      );
    }

    if (event is FetchLocalList) {
      yield ConnectivityNone();
      await Future.delayed(Duration(seconds: 3));
      yield LocalSearch();
    }

    if (event is LocalListLoaded) {
      yield LocalSearchSuccess(localListLoaded: event.localListLoaded!);
    }
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
