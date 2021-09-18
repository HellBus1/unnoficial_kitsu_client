import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_list_controller.dart';
import 'package:unnoficial_kitsu_client/model/anime/base_anime.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';

class UpcomingAnimeController extends BaseListController<BaseAnime> {
  @override
  void onInit() {
    getUpcomingAnime();
    super.onInit();
  }

  @override
  void loadNextPage() {
    page = page + 5;
    getUpcomingAnime(offset: page);
  }

  @override
  void refreshPage() {
    getUpcomingAnime();
  }

  Future<void> getUpcomingAnime({int offset = 0}) async {
    print("upcoming kepanggil?");
    loadingState();
    await client.then(
      (RestClient restClient) => restClient
          .getAnimes(5, offset, "upcoming")
          .validateStatus()
          .then((data) {
        hasNext = data.data!.isNotEmpty;
        dataList.clear();
        addData(data.data!);

        setFinishCallbacks(data.data!);
      }).handleError((onError) {
        finishLoadData(errorMessage: onError.toString());
        debugPrint("error : " + onError.toString());
      }),
    );
  }
}
