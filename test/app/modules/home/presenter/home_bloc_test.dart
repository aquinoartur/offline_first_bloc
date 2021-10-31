import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/domain/usecases/remote_anime_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RemoteAnimeUsecaseMock extends Mock implements RemoteAnimeUsecase {}

main() {
  /*
  final usecase = RemoteAnimeUsecaseMock();
  final bloc = PostBloc(usecase);

  setUp(() {
    when(() => usecase(any(), any()))
        .thenAnswer((_) async => Right(<AnimeEntity>[]));
  });

  group("HomeBloc tests", () { //todo bloc tests with block mock
    blocTest<PostBloc, SearchState>( // happy way
      "Deve retornar os estados em ordem com BlocTest",
      build: () => PostBloc(usecase),
      act: (bloc) => bloc.add(FetchRemoteList(page: 1, offset: 10)),
      expect: () => [isA<SearchLoading>(), isA<SearchSuccess>()],
    );
  });
  */
}
