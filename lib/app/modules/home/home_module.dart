import 'package:desafio_bloc/app/modules/home/domain/usecases/local_anime_usecase.dart';
import 'package:desafio_bloc/app/modules/home/domain/usecases/remote_anime_usecase.dart';
import 'package:desafio_bloc/app/modules/home/external/datasources/remote_anime_datasource.dart';
import 'package:desafio_bloc/app/modules/home/infra/repositories/local_anime_repository.dart';
import 'package:desafio_bloc/app/modules/home/infra/repositories/remote_anime_repository.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/cache_bloc.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/post_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'external/datasources/local_anime_datasource.dart';
import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => RemoteAnimeUsecase(i())),
    Bind.factory((i) => RemoteAnimeRepository(i())),
    Bind.factory((i) => RemoteAnimeDatasource(i())),
    Bind.singleton((i) => PostBloc(
          connectivity: i(),
          usecase: i(),
          animeDTO: i(),
        )),
    //
    Bind.factory((i) => LocalAnimeUsecase(i())),
    Bind.factory((i) => LocalAnimeRepository(i())),
    Bind.factory((i) => LocalAnimeDatasource()),
    Bind.singleton((i) => CacheBloc(postBloc: i(), usecase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (context, args) => HomePage()),
  ];
}
