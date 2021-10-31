import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/usecases/local_anime_usecase.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/events/events.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/post_bloc.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/states/states.dart';

class CacheBloc extends Bloc<PostEvent, SearchState> {
  final ILocalAnimeUsecase usecase;
  final PostBloc postBloc;
  late final StreamSubscription remoteStreamSubscription;

  CacheBloc({required this.usecase, required this.postBloc})
      : super(LocalSearchLoading()) {
    remoteStreamSubscription = postBloc.stream.listen(
      (blocState) {
        if (blocState is SearchSuccess) {
          var remoteNewList = blocState.remoteNewList;
          add(UpdateLocalList(page: 1, offset: 10, newList: remoteNewList));
        }
        if (blocState is LocalSearch) add(FetchLocalList());
      },
    );
  }

  List<AnimeEntity> emptyList = [];
  final int page = 1;
  final int offset = 10;

  @override
  Stream<SearchState> mapEventToState(PostEvent event) async* {
    if (event is UpdateLocalList) {
      yield LocalSearchLoading();
      final result = await usecase(event.page, event.offset, event.newList);
      yield result.fold(
        (l) => LocalSearchError(l),
        (r) {
          return LocalSearchSuccess(localListLoaded: r);
        },
      );
    }

    if (event is FetchLocalList) {
      yield LocalSearchLoading();
      final result = await usecase(page, offset, emptyList);
      yield result.fold(
        (l) => LocalSearchError(l),
        (r) {
          postBloc.add(LocalListLoaded(localListLoaded: r));
          return LocalSearchSuccess(localListLoaded: r);
        },
      );
    }
  }

  @override
  Future<void> close() {
    remoteStreamSubscription.cancel();
    return super.close();
  }
}
