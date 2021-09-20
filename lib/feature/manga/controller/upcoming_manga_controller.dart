import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_list_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';

class UpcomingMangaController extends BaseListController<BaseManganime> {
  @override
  void onInit() {
    getUpcomingManga();
    super.onInit();
  }

  @override
  void loadNextPage() {
    getUpcomingManga();
  }

  @override
  void refreshPage() {
    getUpcomingManga();
  }

  Future<void> getUpcomingManga({int offset = 0}) async {
    loadingState();
    await client.then(
      (RestClient restClient) => restClient
          .getManga(20, offset, "upcoming")
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
