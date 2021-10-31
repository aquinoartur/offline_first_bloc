import 'package:desafio_bloc/app/core/data_transfer_object.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/events/events.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/post_bloc.dart';
import 'package:desafio_bloc/app/modules/home/presenter/blocs/states/states.dart';
import 'package:desafio_bloc/app/modules/home/presenter/controller/home_page_controller.dart';
import 'package:desafio_bloc/app/modules/home/presenter/widgets/connectivity_none_indicator.dart';
import 'package:desafio_bloc/app/modules/home/presenter/widgets/custom_app_bar.dart';
import 'package:desafio_bloc/app/modules/home/presenter/widgets/item_list.dart';
import 'package:desafio_bloc/app/modules/home/presenter/widgets/search_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<PostBloc>();

  ScrollController scrollController = ScrollController();
  final HomePageController controller = HomePageController();
  final AnimeDTO animeDTO = AnimeDTO();

  @override
  void initState() {
    super.initState();
    controller.checkConnectivity(bloc);
    scrollController.addListener(() {
      var pixels = scrollController.position.pixels;
      var scrollSize = scrollController.position.maxScrollExtent;
      if (pixels == scrollSize && bloc.state is! SearchLoading) {
        animeDTO.page = animeDTO.page + 1;
        bloc.add(FetchRemoteList(anime: animeDTO));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: BlocBuilder<PostBloc, SearchState>(
                  bloc: bloc,
                  builder: (context, snapshot) {
                    final state = bloc.state;
                    final loading = state is SearchLoading;

                    if (state is SearchError) {
                      return SearchErrorWidget(
                        onPressed: () {
                          bloc.add(
                            FetchRemoteList(anime: animeDTO),
                          );
                        },
                      );
                    }

                    if (state is LocalSearchError) {
                      return SearchErrorWidget();
                    }

                    if (state is ConnectivityNone)
                      return ConnectivityNoneIndicator();

                    if (state is LocalSearchSuccess) {
                      return ItemList(
                        list: state.localListLoaded,
                        loading: loading,
                        isRemote: false,
                      );
                    }

                    if (state is SearchSuccess)
                      controller.list = state.updatedList;
                    return ItemList(
                      list: controller.list,
                      loading: loading,
                      isRemote: true,
                      scrollController: scrollController,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
