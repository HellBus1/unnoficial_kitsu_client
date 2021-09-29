import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_list_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_object_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';
import 'package:unnoficial_kitsu_client/model/episode.dart';

class AnimeDetailController extends BaseListController<Episode> {
  BaseManganime manganime;

  AnimeDetailController({required this.manganime});

  @override
  void onInit() {
    getAnimeEpisode();
    // print(manganime.toJson());
    super.onInit();
  }

  @override
  void loadNextPage() {
    // page = page + 5;
    // getTrendingAnime(offset: page);
  }

  @override
  void refreshPage() {
    getAnimeEpisode();
  }

  Future<void> getAnimeEpisode() async {
    loadingState();
    await client.then(
      (value) => value
          .getAnimeEpisodes(int.parse(manganime.id))
          .validateStatus()
          .then((data) {
        hasNext = data.data!.isNotEmpty;

        dataList.clear();
        addData(data.data!);

        setFinishCallbacks(data.data!);
      }).handleError((error) {
        finishLoadData(errorMessage: error.toString());
        debugPrint(error.toString());
      }),
    );
  }
}
