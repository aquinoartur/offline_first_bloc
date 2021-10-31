import 'package:connectivity/connectivity.dart';
import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/events/events.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/post_bloc.dart';

class HomePageController {
  int offset = 10;
  int page = 1;
  List<AnimeEntity> list = [];

  Future<void> checkConnectivity(PostBloc bloc) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      bloc.add(FetchLocalList());
    }
  }
}
