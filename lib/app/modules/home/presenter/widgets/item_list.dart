import 'package:desafio_bloc/app/modules/home/domain/entities/anime_entity.dart';
import 'package:desafio_bloc/app/modules/home/presenter/widgets/circular_progress.dart';
import 'package:desafio_bloc/app/modules/home/presenter/widgets/empty_database_indicator.dart';
import 'package:desafio_bloc/app/modules/home/presenter/widgets/info_card.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List<AnimeEntity> list;
  final bool loading;
  final bool isRemote;
  final ScrollController? scrollController;
  const ItemList(
      {required this.list,
      required this.loading,
      required this.isRemote,
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    return isRemote
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              list.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          final item = list[index];
                          return InfoCard(
                            title: item.title,
                            id: item.animeId,
                            index: index + 1,
                            url: item.link,
                            color: Colors.indigo,
                            isRemote: isRemote,
                          );
                        },
                      ),
                    )
                  : Container(),
              loading ? CircularProgress() : Container(),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              list.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          final item = list[index];
                          return InfoCard(
                            title: item.title,
                            id: item.animeId,
                            index: index + 1,
                            url: item.link,
                            color: Color.fromARGB(255, 33, 33, 33),
                            isRemote: isRemote,
                          );
                        },
                      ),
                    )
                  : EmptyDatabaseIndicator(),
              loading ? CircularProgress() : Container(),
            ],
          );
  }
}
