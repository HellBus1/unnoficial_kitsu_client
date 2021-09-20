import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/data/remote/api_services.dart';
import 'package:unnoficial_kitsu_client/data/remote/base/base_list_controller.dart';
import 'package:unnoficial_kitsu_client/data/remote/errorhandler/error_handler.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';

class TrendingMangaController extends BaseListController<BaseManganime> {
  @override
  void onInit() {
    getTrendingManga();
    super.onInit();
  }

  @override
  void loadNextPage() {
    getTrendingManga();
  }

  @override
  void refreshPage() {
    getTrendingManga();
  }

  Future<void> getTrendingManga({int offset = 0}) async {
    print("kesini");
    loadingState();
    await client.then(
      (RestClient restClient) =>
          restClient.getTrendingManga(20, offset).validateStatus().then((data) {
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
